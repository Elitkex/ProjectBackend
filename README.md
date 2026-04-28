# Clash Royale Pakli Építő – Backend

> Node.js + Express alapú REST API a Clash Royale alkalmazáshoz. JWT alapú authentikációt, MySQL adatbázist és teljes CRUD műveleteket biztosít.

---

## Készítette

- [Matlag Máté](https://github.com/Elitkex)
- [Túri Dominik](https://github.com/DomiNikeasd)

---

### Fejlesztési környezet

- **Node.js** Express keretrendszerrel
- **MySQL**

---

## Adatbázis

- **felhasznalok**
  - id
  - felhasznalonev
  - email
  - jelszo
- **kartyak**
  - id
  - name
  - rarity
  - elixir_cost
  - dmg
  - hit_speed
  - img
- **paklik**
  - id
  - user_id
- **paklikartyak**
  - deck_id
  - card_id
  - slot_index
 
![kép az adatbázis kapcsolatokról](https://snipboard.io/K5jGRl.jpg)
>[adatbázis diagram](https://drawsql.app/teams/szotyi-1/diagrams/projekt)

---

## Backend

A backend Node.js alapú, Express keretrendszerrel és MySQL adatbázissal működik. Feladata kommunikációs hidat létesíteni a frontend és az adatbázis között.

### Telepítés és futtatás

```bash
git clone https://github.com/Elitkex/ProjectBackend
cd ProjectBackend
npm install
node backend.js
```

---

### Mappa struktúra

```
ProjectBackend/
├── backend.js          # Szerver belépési pont, összes végpont
├── import_cards.js     # Kártyaadatok importálása
├── package.json
└── .env
```

---

### Használt package-ek

- [express](https://www.npmjs.com/package/express)
- [mysql2](https://www.npmjs.com/package/mysql2)
- [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken)
- [bcryptjs](https://www.npmjs.com/package/bcryptjs)
- [cookie-parser](https://www.npmjs.com/package/cookie-parser)
- [cors](https://www.npmjs.com/package/cors)
- [node-email-verifier](https://www.npmjs.com/package/node-email-verifier)

```json
"dependencies": {
  "bcrypt": "^5.1.1",
  "cookie-parser": "^1.4.7",
  "cors": "^2.8.5",
  "express": "^4.21.1",
  "jsonwebtoken": "^9.0.2",
  "mysql2": "^3.11.4",
  "node-email-verifier": "^2.0.0"
}
```

---

### Biztonság

- **JWT** token alapú hitelesítés httpOnly cookie-ban
- Jelszavak **bcrypt**-tel hashelve
- Middleware szintű authentikáció
- Email validáció `node-email-verifier`-rel
- A `.env` fájl tartalmaz minden érzékeny adatot

---

### Végpontok

1. **Auth végpontok**

   | Művelet | HTTP | Végpont | Leírás |
   |---|---|---|---|
   | Regisztráció | POST | `/regisztracio` | Új felhasználó regisztrálása |
   | Bejelentkezés | POST | `/belepes` | Felhasználó bejelentkezése |
   | Kijelentkezés | POST | `/kijelentkezes` | Felhasználó kijelentkezése *(hitelesítés szükséges)* |
   | Adatok lekérése | GET | `/adataim` | Bejelentkezett felhasználó adatai *(hitelesítés szükséges)* |

2. **Fiók kezelés végpontok**

   | Művelet | HTTP | Végpont | Leírás |
   |---|---|---|---|
   | Felhasználónév módosítása | PUT | `/felhasznalonev` | *(hitelesítés szükséges)* |
   | Email módosítása | PUT | `/email` | *(hitelesítés szükséges)* |
   | Jelszó módosítása | PUT | `/jelszo` | *(hitelesítés szükséges)* |
   | Fiók törlése | DELETE | `/fioktorles` | *(hitelesítés szükséges)* |

3. **Kártya végpontok**

   | Művelet | HTTP | Végpont | Leírás |
   |---|---|---|---|
   | Összes kártya | GET | `/kartyak` | Összes kártya listázása *(hitelesítés szükséges)* |

4. **Pakli végpontok**

   | Művelet | HTTP | Végpont | Leírás |
   |---|---|---|---|
   | Paklik lekérése | GET | `/decks` | Bejelentkezett felhasználó paklijai *(hitelesítés szükséges)* |
   | Egy pakli lekérése | GET | `/decks/:id` | *(hitelesítés szükséges)* |
   | Új pakli | POST | `/decks` | *(hitelesítés szükséges)* |
   | Pakli frissítése | PUT | `/decks/:id` | *(hitelesítés szükséges)* |
   | Pakli törlése | DELETE | `/decks/:id` | *(hitelesítés szükséges)* |
   | Részleges pakli létrehozása | POST | `/decks/partial` | *(hitelesítés szükséges)* |
   | Részleges pakli frissítése | PUT | `/decks/partial/:id` | *(hitelesítés szükséges)* |

---

### Tesztelés

A projekt manuálisan lett tesztelve **Postman** segítségével.

---

### Továbbfejlesztési lehetőség

- Paklik megosztása felhasználók között
- Kártyastatisztikák részletesebb adatokkal

---

### Használt eszközök

- [VS Code](https://code.visualstudio.com)
- [Postman](https://www.postman.com)
- [phpMyAdmin](https://www.phpmyadmin.net)
- [GitHub](https://github.com)
- [NPM](https://www.npmjs.com)
- [Claude](https://claude.ai)
- [Figma](https://figma.com)

## Frontend

- [Github repo](https://github.com/Elitkex/ProjectFrontend)
