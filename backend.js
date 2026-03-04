const express = require('express')
const cors = require('cors')
const cookieParser = require('cookie-parser')
const bcrypt = require('bcrypt')
const mysql = require('mysql2/promise')
const jwt = require('jsonwebtoken')
const emailValidator = require('node-email-verifier')

// config
const PORT = 3000
const HOST = 'localhost'
const JWT_SECRET = 'nagyon_egyedi_jelszo_fasz'
const JWT_EXPIRES_IN = '7d'
const COOKIE_NAME = 'auth_token'

const COOKIE_OPTS = {
    httpOnly: true,
    secure: false,
    sameSite: 'lax',
    path: '/',
    maxAge: 7 * 24 * 60 * 60 * 1000,
}

const db = mysql.createPool({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: '',
    database: 'clashroyale',
})

const app = express()

app.use(express.json())
app.use(cookieParser())
app.use(cors({
    origin: 'http://localhost:5173', // JAVÍTVA: Vite dev szerver portja
    credentials: true
}))

// Middleware
function auth(req, res, next) {
    const token = req.cookies[COOKIE_NAME]
    if (!token) {
        return res.status(409).json({ message: "Nem vagy bejelentkezve" })
    }
    try {
        req.user = jwt.verify(token, JWT_SECRET)
        next()
    } catch (error) {
        console.log(error)
        return res.status(410).json({ message: "Nem érvényes token" })
    }
}

// ─── REGISZTRÁCIÓ ────────────────────────────────────────

app.post('/regisztracio', async (req, res) => {
    const { email, felhasznalonev, jelszo } = req.body

    if (!email || !felhasznalonev || !jelszo) {
        return res.status(400).json({ message: "Hiányzó bemeneti adatok" })
    }

    try {
        const isValid = await emailValidator(email)
        if (!isValid) {
            return res.status(401).json({ message: "Nem létező emailcímet adott meg!" })
        }

        const [exists] = await db.query(
            'SELECT * FROM felhasznalok WHERE email = ? OR felhasznalonev = ?',
            [email, felhasznalonev]
        )
        if (exists.length) {
            return res.status(402).json({ message: "Az email cím vagy felhasználónév már foglalt" })
        }

        const hash = await bcrypt.hash(jelszo, 10)
        const [result] = await db.query(
            'INSERT INTO felhasznalok (email, felhasznalonev, jelszo) VALUES (?,?,?)',
            [email, felhasznalonev, hash]
        )

        return res.status(200).json({
            message: "Sikeres regisztráció",
            id: result.insertId // JAVÍTVA: result.insertId
        })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ message: "Szerverhiba" })
    }
})

// ─── BELÉPÉS ─────────────────────────────────────────────

// JAVÍTVA: auth middleware eltávolítva, belépéskor még nincs token
app.post('/belepes', auth, async (req, res) => {
    const { felhasznalonevVagyEmail, jelszo } = req.body
    if (!felhasznalonevVagyEmail || !jelszo) {
        return res.status(400).json({ message: "Hiányos belépési adatok" })
    }
    try {
        const isValid = await emailValidator(felhasznalonevVagyEmail)
        let hashjelszo = ""
        let user = {}

        if (isValid) {
            const [rows] = await db.query('SELECT * FROM felhasznalok WHERE email = ?', [felhasznalonevVagyEmail])
            if (rows.length) {
                user = rows[0]
                hashjelszo = user.jelszo
            } else {
                return res.status(401).json({ message: "Ehhez az emailcímhez nem tartozik fiók" })
            }
        } else {
            const [rows] = await db.query('SELECT * FROM felhasznalok WHERE felhasznalonev = ?', [felhasznalonevVagyEmail])
            if (rows.length) {
                user = rows[0]
                hashjelszo = user.jelszo
            } else {
                return res.status(402).json({ message: "Ehhez a felhasználónévhez nem tartozik fiók" })
            }
        }

        const ok = await bcrypt.compare(jelszo, hashjelszo)
        if (!ok) {
            return res.status(403).json({ message: "Rossz jelszót adtál meg" })
        }

        const token = jwt.sign(
            { id: user.id, email: user.email, felhasznalonev: user.felhasznalonev },
            JWT_SECRET,
            { expiresIn: JWT_EXPIRES_IN }
        )

        res.cookie(COOKIE_NAME, token, COOKIE_OPTS)
        res.status(200).json({ message: "Sikeres belépés" })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ message: "Szerverhiba" })
    }
})

// ─── KIJELENTKEZÉS ───────────────────────────────────────

app.post('/kijelentkezes', auth, async (req, res) => {
    res.clearCookie(COOKIE_NAME, { path: '/' })
    res.status(200).json({ message: "Sikeres kijelentkezés" })
})

// ─── ADATAIM ─────────────────────────────────────────────

app.get('/adataim', auth, async (req, res) => {
    res.status(200).json(req.user)
})

// ─── KÁRTYÁK ─────────────────────────────────────────────

app.get('/kartyak', auth, async (req, res) => {
    try {
        const [results] = await db.query('SELECT * FROM kartyak')
        res.status(200).json(results)
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

// ─── PAKLIK ──────────────────────────────────────────────

// Összes pakli kártyákkal
app.get('/decks', auth, async (req, res) => {
    try {
        const [decks] = await db.query('SELECT * FROM paklik WHERE user_id = ?', [req.user.id])

        for (let deck of decks) {
            const [cards] = await db.query(
                `SELECT kartyak.id, kartyak.name, kartyak.rarity, kartyak.elixir_cost
                 FROM paklikartyak pk
                 JOIN kartyak ON pk.card_id = kartyak.id
                 WHERE pk.deck_id = ?`, // JAVÍTVA: k.id -> kartyak.id
                [deck.id]
            )
            deck.kartyak = cards
        }

        res.status(200).json(decks)
    } catch (err) {
        console.error(err)
        res.status(500).json({ message: 'Szerverhiba' })
    }
})

// Egy pakli lekérése
app.get('/decks/:id', auth, async (req, res) => {
    try {
        const [decks] = await db.query(
            'SELECT * FROM paklik WHERE id = ? AND user_id = ?',
            [req.params.id, req.user.id]
        )
        if (!decks.length) {
            return res.status(404).json({ message: "Pakli nem található" })
        }
        const [cards] = await db.query(
            `SELECT kartyak.id, kartyak.name, kartyak.rarity, kartyak.elixir_cost
             FROM paklikartyak pk
             JOIN kartyak ON pk.card_id = kartyak.id
             WHERE pk.deck_id = ?`,
            [req.params.id]
        )
        res.status(200).json({ ...decks[0], kartyak: cards })
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

// Új pakli
app.post('/decks', auth, async (req, res) => {
    const { kartya_ids } = req.body
    if (!kartya_ids || kartya_ids.length !== 8) {
        return res.status(400).json({ message: "Pontosan 8 kártya szükséges" })
    }
    try {
        const [result] = await db.query('INSERT INTO paklik (user_id) VALUES (?)', [req.user.id])
        const pakli_id = result.insertId
        const values = kartya_ids.map(kid => [pakli_id, kid])
        await db.query('INSERT INTO paklikartyak (deck_id, card_id) VALUES ?', [values])
        res.status(201).json({ message: "Pakli létrehozva", pakli_id })
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

// Pakli frissítése
app.put('/decks/:id', auth, async (req, res) => {
    const { kartya_ids } = req.body
    if (!kartya_ids || kartya_ids.length !== 8) {
        return res.status(400).json({ message: "Pontosan 8 kártya szükséges" })
    }
    try {
        const [decks] = await db.query(
            'SELECT * FROM paklik WHERE id = ? AND user_id = ?',
            [req.params.id, req.user.id]
        )
        if (!decks.length) return res.status(404).json({ message: "Pakli nem található" })

        await db.query('DELETE FROM paklikartyak WHERE deck_id = ?', [req.params.id])
        const values = kartya_ids.map(kid => [req.params.id, kid])
        await db.query('INSERT INTO paklikartyak (deck_id, card_id) VALUES ?', [values])
        res.status(200).json({ message: "Pakli frissítve" })
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

// Pakli törlése
app.delete('/decks/:id', auth, async (req, res) => {
    try {
        const [decks] = await db.query(
            'SELECT * FROM paklik WHERE id = ? AND user_id = ?',
            [req.params.id, req.user.id]
        )
        if (!decks.length) return res.status(404).json({ message: "Pakli nem található" })

        await db.query('DELETE FROM paklikartyak WHERE deck_id = ?', [req.params.id])
        await db.query('DELETE FROM paklik WHERE id = ?', [req.params.id])
        res.status(200).json({ message: "Pakli törölve" })
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

// ─── FIÓK KEZELÉS ────────────────────────────────────────

app.delete('/fioktorles', auth, async (req, res) => {
    try {
        await db.query('DELETE FROM felhasznalok WHERE id = ?', [req.user.id]) // JAVÍTVA: req, user -> req.user
        res.clearCookie(COOKIE_NAME, { path: '/' })
        res.status(200).json({ message: "Sikeres fiók törlés" })
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

app.put('/email', auth, async (req, res) => {
    const { ujEmail } = req.body
    if (!ujEmail) return res.status(401).json({ message: "Az új email megadása kötelező" })

    const isValid = await emailValidator(ujEmail)
    if (!isValid) return res.status(402).json({ message: "Az email formátuma nem megfelelő" })

    try {
        const [result] = await db.query('SELECT * FROM felhasznalok WHERE email = ?', [ujEmail])
        if (result.length) return res.status(402).json({ message: "Az emailcím már foglalt" })

        await db.query('UPDATE felhasznalok SET email = ? WHERE id = ?', [ujEmail, req.user.id])
        return res.status(200).json({ message: "Sikeresen módosult az email" })
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

app.put('/felhasznalonev', auth, async (req, res) => {
    const { ujFelhasznalonev } = req.body
    if (!ujFelhasznalonev) return res.status(401).json({ message: "Az új felhasználónév megadása kötelező" })

    try {
        const [result] = await db.query('SELECT * FROM felhasznalok WHERE felhasznalonev = ?', [ujFelhasznalonev])
        if (result.length) return res.status(402).json({ message: "A felhasználónév már foglalt" })

        await db.query('UPDATE felhasznalok SET felhasznalonev = ? WHERE id = ?', [ujFelhasznalonev, req.user.id])
        return res.status(200).json({ message: "Sikeresen módosult a felhasználónév" })
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

app.put('/jelszo', auth, async (req, res) => {
    const { ujJelszo } = req.body
    if (!ujJelszo) return res.status(401).json({ message: "Az új jelszó megadása kötelező" })

    try {
        const hash = await bcrypt.hash(ujJelszo, 10) // JAVÍTVA: hashelni kell
        await db.query('UPDATE felhasznalok SET jelszo = ? WHERE id = ?', [hash, req.user.id]) // JAVÍTVA: jelszo oszlop
        return res.status(200).json({ message: "Sikeresen módosult a jelszó" })
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Szerverhiba" })
    }
})

// ─── SZERVER ─────────────────────────────────────────────

app.listen(PORT, HOST, () => {
    console.log(`http://${HOST}:${PORT}/`)
})