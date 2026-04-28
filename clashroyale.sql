-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Gép: 192.168.255.103
-- Létrehozás ideje: 2026. Ápr 28. 09:35
-- Kiszolgáló verziója: 11.4.7-MariaDB-log
-- PHP verzió: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `clashroyale`
--
CREATE DATABASE IF NOT EXISTS `clashroyale` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `clashroyale`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

DROP TABLE IF EXISTS `felhasznalok`;
CREATE TABLE `felhasznalok` (
  `id` int(10) UNSIGNED NOT NULL,
  `felhasznalonev` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `jelszo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `felhasznalonev`, `email`, `jelszo`) VALUES
(29, 'teszt', 'teszt@gmail.com', '$2b$10$TyOIuShwt9HxylK2gjSdGuuYThXUb14/ymHolMPnCcmgVq837/p8u');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kartyak`
--

DROP TABLE IF EXISTS `kartyak`;
CREATE TABLE `kartyak` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `rarity` varchar(50) NOT NULL,
  `elixir_cost` int(11) NOT NULL,
  `dmg` int(11) NOT NULL,
  `hit_speed` double NOT NULL DEFAULT 0,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `kartyak`
--

INSERT INTO `kartyak` (`id`, `name`, `rarity`, `elixir_cost`, `dmg`, `hit_speed`, `img`) VALUES
(1, 'Knight', 'Common', 3, 482, 1.9, 'https://cdn.royaleapi.com/static/img/cards/knight.png'),
(2, 'Archers', 'Common', 3, 495, 1.2, 'https://cdn.royaleapi.com/static/img/cards/archers.png'),
(3, 'Goblins', 'Common', 2, 130, 1.9, 'https://cdn.royaleapi.com/static/img/cards/goblins.png'),
(4, 'Giant', 'Rare', 5, 68, 0.6, 'https://cdn.royaleapi.com/static/img/cards/giant.png'),
(5, 'P.E.K.K.A', 'Epic', 7, 169, 2.5, 'https://cdn.royaleapi.com/static/img/cards/pekka.png'),
(6, 'Minions', 'Common', 3, 150, 0.6, 'https://cdn.royaleapi.com/static/img/cards/minions.png'),
(7, 'Balloon', 'Epic', 5, 378, 0.8, 'https://cdn.royaleapi.com/static/img/cards/balloon.png'),
(8, 'Witch', 'Epic', 5, 397, 0.6, 'https://cdn.royaleapi.com/static/img/cards/witch.png'),
(9, 'Barbarians', 'Common', 5, 185, 0.8, 'https://cdn.royaleapi.com/static/img/cards/barbarians.png'),
(10, 'Golem', 'Epic', 8, 498, 0.6, 'https://cdn.royaleapi.com/static/img/cards/golem.png'),
(11, 'Skeletons', 'Common', 1, 349, 2.1, 'https://cdn.royaleapi.com/static/img/cards/skeletons.png'),
(12, 'Valkyrie', 'Rare', 4, 204, 0.7, 'https://cdn.royaleapi.com/static/img/cards/valkyrie.png'),
(13, 'Skeleton Army', 'Epic', 3, 287, 0.8, 'https://cdn.royaleapi.com/static/img/cards/skeleton-army.png'),
(14, 'Bomber', 'Common', 2, 166, 2, 'https://cdn.royaleapi.com/static/img/cards/bomber.png'),
(15, 'Musketeer', 'Rare', 4, 125, 1.4, 'https://cdn.royaleapi.com/static/img/cards/musketeer.png'),
(16, 'Baby Dragon', 'Epic', 4, 439, 1.6, 'https://cdn.royaleapi.com/static/img/cards/baby-dragon.png'),
(17, 'Prince', 'Epic', 5, 272, 1.6, 'https://cdn.royaleapi.com/static/img/cards/prince.png'),
(18, 'Wizard', 'Rare', 5, 271, 1.6, 'https://cdn.royaleapi.com/static/img/cards/wizard.png'),
(19, 'Mini P.E.K.K.A', 'Rare', 4, 255, 1.3, 'https://cdn.royaleapi.com/static/img/cards/mini-pekka.png'),
(20, 'Spear Goblins', 'Common', 2, 469, 2.4, 'https://cdn.royaleapi.com/static/img/cards/spear-goblins.png'),
(21, 'Giant Skeleton', 'Epic', 6, 169, 1.2, 'https://cdn.royaleapi.com/static/img/cards/giant-skeleton.png'),
(22, 'Hog Rider', 'Rare', 4, 549, 2.4, 'https://cdn.royaleapi.com/static/img/cards/hog-rider.png'),
(23, 'Minion Horde', 'Common', 5, 464, 1, 'https://cdn.royaleapi.com/static/img/cards/minion-horde.png'),
(24, 'Ice Wizard', 'Legendary', 3, 430, 0.6, 'https://cdn.royaleapi.com/static/img/cards/ice-wizard.png'),
(25, 'Royal Giant', 'Common', 6, 56, 2.3, 'https://cdn.royaleapi.com/static/img/cards/royal-giant.png'),
(26, 'Guards', 'Epic', 3, 248, 1.1, 'https://cdn.royaleapi.com/static/img/cards/guards.png'),
(27, 'Princess', 'Legendary', 3, 263, 0.8, 'https://cdn.royaleapi.com/static/img/cards/princess.png'),
(28, 'Dark Prince', 'Epic', 4, 313, 0.8, 'https://cdn.royaleapi.com/static/img/cards/dark-prince.png'),
(29, 'Three Musketeers', 'Rare', 9, 146, 1.5, 'https://cdn.royaleapi.com/static/img/cards/three-musketeers.png'),
(30, 'Lava Hound', 'Legendary', 7, 504, 0.6, 'https://cdn.royaleapi.com/static/img/cards/lava-hound.png'),
(31, 'Ice Spirit', 'Common', 1, 326, 1.7, 'https://cdn.royaleapi.com/static/img/cards/ice-spirit.png'),
(32, 'Fire Spirit', 'Common', 1, 215, 2.2, 'https://cdn.royaleapi.com/static/img/cards/fire-spirit.png'),
(33, 'Miner', 'Legendary', 3, 204, 2.4, 'https://cdn.royaleapi.com/static/img/cards/miner.png'),
(34, 'Sparky', 'Legendary', 6, 486, 1.5, 'https://cdn.royaleapi.com/static/img/cards/sparky.png'),
(35, 'Bowler', 'Epic', 5, 457, 1.7, 'https://cdn.royaleapi.com/static/img/cards/bowler.png'),
(36, 'Lumberjack', 'Legendary', 4, 366, 1.1, 'https://cdn.royaleapi.com/static/img/cards/lumberjack.png'),
(37, 'Battle Ram', 'Rare', 4, 389, 1.4, 'https://cdn.royaleapi.com/static/img/cards/battle-ram.png'),
(38, 'Inferno Dragon', 'Legendary', 4, 153, 1.9, 'https://cdn.royaleapi.com/static/img/cards/inferno-dragon.png'),
(39, 'Ice Golem', 'Rare', 2, 464, 0.6, 'https://cdn.royaleapi.com/static/img/cards/ice-golem.png'),
(40, 'Mega Minion', 'Rare', 3, 491, 0.9, 'https://cdn.royaleapi.com/static/img/cards/mega-minion.png'),
(41, 'Dart Goblin', 'Rare', 3, 204, 2.4, 'https://cdn.royaleapi.com/static/img/cards/dart-goblin.png'),
(42, 'Goblin Gang', 'Common', 3, 519, 2, 'https://cdn.royaleapi.com/static/img/cards/goblin-gang.png'),
(43, 'Electro Wizard', 'Legendary', 4, 76, 2.4, 'https://cdn.royaleapi.com/static/img/cards/electro-wizard.png'),
(44, 'Elite Barbarians', 'Common', 6, 321, 2.3, 'https://cdn.royaleapi.com/static/img/cards/elite-barbarians.png'),
(45, 'Hunter', 'Epic', 4, 481, 1.7, 'https://cdn.royaleapi.com/static/img/cards/hunter.png'),
(46, 'Executioner', 'Epic', 5, 302, 1.8, 'https://cdn.royaleapi.com/static/img/cards/executioner.png'),
(47, 'Bandit', 'Legendary', 3, 459, 0.7, 'https://cdn.royaleapi.com/static/img/cards/bandit.png'),
(48, 'Royal Recruits', 'Common', 7, 68, 2.3, 'https://cdn.royaleapi.com/static/img/cards/royal-recruits.png'),
(49, 'Night Witch', 'Legendary', 4, 205, 2.3, 'https://cdn.royaleapi.com/static/img/cards/night-witch.png'),
(50, 'Bats', 'Common', 2, 344, 1, 'https://cdn.royaleapi.com/static/img/cards/bats.png'),
(51, 'Royal Ghost', 'Legendary', 3, 253, 1.2, 'https://cdn.royaleapi.com/static/img/cards/royal-ghost.png'),
(52, 'Ram Rider', 'Legendary', 5, 255, 0.6, 'https://cdn.royaleapi.com/static/img/cards/ram-rider.png'),
(53, 'Zappies', 'Rare', 4, 117, 1.4, 'https://cdn.royaleapi.com/static/img/cards/zappies.png'),
(54, 'Rascals', 'Common', 5, 489, 0.5, 'https://cdn.royaleapi.com/static/img/cards/rascals.png'),
(55, 'Cannon Cart', 'Epic', 5, 289, 1.1, 'https://cdn.royaleapi.com/static/img/cards/cannon-cart.png'),
(56, 'Mega Knight', 'Legendary', 7, 143, 2.4, 'https://cdn.royaleapi.com/static/img/cards/mega-knight.png'),
(57, 'Skeleton Barrel', 'Common', 3, 163, 1, 'https://cdn.royaleapi.com/static/img/cards/skeleton-barrel.png'),
(58, 'Flying Machine', 'Rare', 4, 364, 1.2, 'https://cdn.royaleapi.com/static/img/cards/flying-machine.png'),
(59, 'Wall Breakers', 'Epic', 2, 506, 1.5, 'https://cdn.royaleapi.com/static/img/cards/wall-breakers.png'),
(60, 'Royal Hogs', 'Rare', 5, 388, 2.4, 'https://cdn.royaleapi.com/static/img/cards/royal-hogs.png'),
(61, 'Goblin Giant', 'Epic', 6, 366, 1.2, 'https://cdn.royaleapi.com/static/img/cards/goblin-giant.png'),
(62, 'Fisherman', 'Legendary', 3, 524, 1.8, 'https://cdn.royaleapi.com/static/img/cards/fisherman.png'),
(63, 'Magic Archer', 'Legendary', 4, 216, 2, 'https://cdn.royaleapi.com/static/img/cards/magic-archer.png'),
(64, 'Electro Dragon', 'Epic', 5, 442, 1.8, 'https://cdn.royaleapi.com/static/img/cards/electro-dragon.png'),
(65, 'Firecracker', 'Common', 3, 512, 1.8, 'https://cdn.royaleapi.com/static/img/cards/firecracker.png'),
(66, 'Mighty Miner', 'Champion', 4, 306, 1.7, 'https://cdn.royaleapi.com/static/img/cards/mighty-miner.png'),
(67, 'Super Witch', 'Legendary', 6, 266, 1.3, 'https://cdn.royaleapi.com/static/img/cards/super-witch.png'),
(68, 'Elixir Golem', 'Rare', 3, 354, 2.3, 'https://cdn.royaleapi.com/static/img/cards/elixir-golem.png'),
(69, 'Battle Healer', 'Rare', 4, 377, 1.7, 'https://cdn.royaleapi.com/static/img/cards/battle-healer.png'),
(70, 'Skeleton King', 'Champion', 4, 530, 0.6, 'https://cdn.royaleapi.com/static/img/cards/skeleton-king.png'),
(71, 'Super Lava Hound', 'Legendary', 8, 225, 1.7, 'https://cdn.royaleapi.com/static/img/cards/super-lava-hound.png'),
(72, 'Super Magic Archer', 'Legendary', 5, 62, 1.1, 'https://cdn.royaleapi.com/static/img/cards/super-magic-archer.png'),
(73, 'Archer Queen', 'Champion', 5, 207, 2, 'https://cdn.royaleapi.com/static/img/cards/archer-queen.png'),
(74, 'Santa Hog Rider', 'Legendary', 5, 425, 1.6, 'https://cdn.royaleapi.com/static/img/cards/santa-hog-rider.png'),
(75, 'Golden Knight', 'Champion', 4, 272, 1.7, 'https://cdn.royaleapi.com/static/img/cards/golden-knight.png'),
(76, 'Super Ice Golem', 'Legendary', 4, 396, 1.8, 'https://cdn.royaleapi.com/static/img/cards/super-ice-golem.png'),
(77, 'Monk', 'Champion', 5, 122, 2.1, 'https://cdn.royaleapi.com/static/img/cards/monk.png'),
(78, 'Super Archers', 'Legendary', 3, 313, 1, 'https://cdn.royaleapi.com/static/img/cards/super-archers.png'),
(79, 'Skeleton Dragons', 'Common', 4, 410, 2.1, 'https://cdn.royaleapi.com/static/img/cards/skeleton-dragons.png'),
(80, 'Terry', 'Champion', 4, 520, 1, 'https://cdn.royaleapi.com/static/img/cards/terry.png'),
(81, 'Super Mini P.E.K.K.A', 'Legendary', 5, 242, 0.9, 'https://cdn.royaleapi.com/static/img/cards/super-mini-pekka.png'),
(82, 'Mother Witch', 'Legendary', 4, 466, 1.6, 'https://cdn.royaleapi.com/static/img/cards/mother-witch.png'),
(83, 'Electro Spirit', 'Common', 1, 236, 0.8, 'https://cdn.royaleapi.com/static/img/cards/electro-spirit.png'),
(84, 'Electro Giant', 'Epic', 7, 340, 1.5, 'https://cdn.royaleapi.com/static/img/cards/electro-giant.png'),
(85, 'Raging Prince', 'Epic', 5, 388, 2.4, 'https://cdn.royaleapi.com/static/img/cards/raging-prince.png'),
(86, 'Phoenix', 'Legendary', 4, 362, 1.2, 'https://cdn.royaleapi.com/static/img/cards/phoenix.png'),
(87, 'Cannon', 'Common', 3, 435, 2.2, 'https://cdn.royaleapi.com/static/img/cards/cannon.png'),
(88, 'Goblin Hut', 'Rare', 5, 71, 1.7, 'https://cdn.royaleapi.com/static/img/cards/goblin-hut.png'),
(89, 'Mortar', 'Common', 4, 493, 1.8, 'https://cdn.royaleapi.com/static/img/cards/mortar.png'),
(90, 'Inferno Tower', 'Rare', 5, 287, 1.5, 'https://cdn.royaleapi.com/static/img/cards/inferno-tower.png'),
(91, 'Bomb Tower', 'Rare', 4, 71, 2, 'https://cdn.royaleapi.com/static/img/cards/bomb-tower.png'),
(92, 'Barbarian Hut', 'Rare', 6, 322, 1.5, 'https://cdn.royaleapi.com/static/img/cards/barbarian-hut.png'),
(93, 'Tesla', 'Common', 4, 532, 1, 'https://cdn.royaleapi.com/static/img/cards/tesla.png'),
(94, 'Elixir Collector', 'Rare', 6, 258, 1.1, 'https://cdn.royaleapi.com/static/img/cards/elixir-collector.png'),
(95, 'X-Bow', 'Epic', 6, 178, 1.3, 'https://cdn.royaleapi.com/static/img/cards/x-bow.png'),
(96, 'Tombstone', 'Rare', 3, 120, 1.6, 'https://cdn.royaleapi.com/static/img/cards/tombstone.png'),
(97, 'Furnace', 'Rare', 4, 224, 0.7, 'https://cdn.royaleapi.com/static/img/cards/furnace.png'),
(98, 'Goblin Cage', 'Rare', 4, 225, 1.5, 'https://cdn.royaleapi.com/static/img/cards/goblin-cage.png'),
(99, 'Goblin Drill', 'Epic', 4, 318, 0.8, 'https://cdn.royaleapi.com/static/img/cards/goblin-drill.png'),
(100, 'Party Hut', 'Legendary', 5, 63, 2, 'https://cdn.royaleapi.com/static/img/cards/party-hut.png'),
(101, 'Fireball', 'Rare', 4, 396, 0.9, 'https://cdn.royaleapi.com/static/img/cards/fireball.png'),
(102, 'Arrows', 'Common', 3, 519, 0.7, 'https://cdn.royaleapi.com/static/img/cards/arrows.png'),
(103, 'Rage', 'Epic', 2, 349, 2, 'https://cdn.royaleapi.com/static/img/cards/rage.png'),
(104, 'Rocket', 'Rare', 6, 521, 1.4, 'https://cdn.royaleapi.com/static/img/cards/rocket.png'),
(105, 'Goblin Barrel', 'Epic', 3, 318, 1, 'https://cdn.royaleapi.com/static/img/cards/goblin-barrel.png'),
(106, 'Freeze', 'Epic', 4, 404, 2, 'https://cdn.royaleapi.com/static/img/cards/freeze.png'),
(107, 'Mirror', 'Epic', 1, 369, 2.4, 'https://cdn.royaleapi.com/static/img/cards/mirror.png'),
(108, 'Lightning', 'Epic', 6, 437, 0.6, 'https://cdn.royaleapi.com/static/img/cards/lightning.png'),
(109, 'Zap', 'Common', 2, 537, 1.9, 'https://cdn.royaleapi.com/static/img/cards/zap.png'),
(110, 'Poison', 'Epic', 4, 331, 1.9, 'https://cdn.royaleapi.com/static/img/cards/poison.png'),
(111, 'Graveyard', 'Legendary', 5, 501, 1.2, 'https://cdn.royaleapi.com/static/img/cards/graveyard.png'),
(112, 'The Log', 'Legendary', 2, 95, 1.2, 'https://cdn.royaleapi.com/static/img/cards/the-log.png'),
(113, 'Tornado', 'Epic', 3, 344, 2.2, 'https://cdn.royaleapi.com/static/img/cards/tornado.png'),
(114, 'Clone', 'Epic', 3, 234, 1.2, 'https://cdn.royaleapi.com/static/img/cards/clone.png'),
(115, 'Earthquake', 'Rare', 3, 399, 1.3, 'https://cdn.royaleapi.com/static/img/cards/earthquake.png'),
(116, 'Barbarian Barrel', 'Epic', 2, 529, 1.6, 'https://cdn.royaleapi.com/static/img/cards/barbarian-barrel.png'),
(117, 'Heal Spirit', 'Rare', 1, 512, 2.4, 'https://cdn.royaleapi.com/static/img/cards/heal-spirit.png'),
(118, 'Giant Snowball', 'Common', 2, 529, 2.4, 'https://cdn.royaleapi.com/static/img/cards/giant-snowball.png'),
(119, 'Royal Delivery', 'Common', 3, 497, 1.7, 'https://cdn.royaleapi.com/static/img/cards/royal-delivery.png'),
(120, 'Party Rocket', 'Legendary', 5, 236, 0.6, 'https://cdn.royaleapi.com/static/img/cards/party-rocket.png'),
(121, 'Knight', 'Common', 3, 58, 0.5, 'https://cdn.royaleapi.com/static/img/cards/knight.png'),
(122, 'Archers', 'Common', 3, 527, 2, 'https://cdn.royaleapi.com/static/img/cards/archers.png'),
(123, 'Goblins', 'Common', 2, 547, 1.8, 'https://cdn.royaleapi.com/static/img/cards/goblins.png'),
(124, 'Giant', 'Rare', 5, 202, 1.6, 'https://cdn.royaleapi.com/static/img/cards/giant.png'),
(125, 'P.E.K.K.A', 'Epic', 7, 477, 1.7, 'https://cdn.royaleapi.com/static/img/cards/pekka.png'),
(126, 'Minions', 'Common', 3, 291, 1.7, 'https://cdn.royaleapi.com/static/img/cards/minions.png'),
(127, 'Balloon', 'Epic', 5, 291, 1.8, 'https://cdn.royaleapi.com/static/img/cards/balloon.png'),
(128, 'Witch', 'Epic', 5, 466, 0.9, 'https://cdn.royaleapi.com/static/img/cards/witch.png'),
(129, 'Barbarians', 'Common', 5, 283, 2, 'https://cdn.royaleapi.com/static/img/cards/barbarians.png'),
(130, 'Golem', 'Epic', 8, 233, 1.7, 'https://cdn.royaleapi.com/static/img/cards/golem.png'),
(131, 'Skeletons', 'Common', 1, 440, 0.8, 'https://cdn.royaleapi.com/static/img/cards/skeletons.png'),
(132, 'Valkyrie', 'Rare', 4, 308, 0.6, 'https://cdn.royaleapi.com/static/img/cards/valkyrie.png'),
(133, 'Skeleton Army', 'Epic', 3, 448, 2, 'https://cdn.royaleapi.com/static/img/cards/skeleton-army.png'),
(134, 'Bomber', 'Common', 2, 289, 0.6, 'https://cdn.royaleapi.com/static/img/cards/bomber.png'),
(135, 'Musketeer', 'Rare', 4, 509, 1.3, 'https://cdn.royaleapi.com/static/img/cards/musketeer.png'),
(136, 'Baby Dragon', 'Epic', 4, 136, 1.9, 'https://cdn.royaleapi.com/static/img/cards/baby-dragon.png'),
(137, 'Prince', 'Epic', 5, 63, 0.5, 'https://cdn.royaleapi.com/static/img/cards/prince.png'),
(138, 'Wizard', 'Rare', 5, 520, 1.9, 'https://cdn.royaleapi.com/static/img/cards/wizard.png'),
(139, 'Mini P.E.K.K.A', 'Rare', 4, 363, 0.6, 'https://cdn.royaleapi.com/static/img/cards/mini-pekka.png'),
(140, 'Spear Goblins', 'Common', 2, 266, 2.5, 'https://cdn.royaleapi.com/static/img/cards/spear-goblins.png'),
(141, 'Giant Skeleton', 'Epic', 6, 344, 0.5, 'https://cdn.royaleapi.com/static/img/cards/giant-skeleton.png'),
(142, 'Hog Rider', 'Rare', 4, 194, 1.3, 'https://cdn.royaleapi.com/static/img/cards/hog-rider.png'),
(143, 'Minion Horde', 'Common', 5, 148, 2, 'https://cdn.royaleapi.com/static/img/cards/minion-horde.png'),
(144, 'Ice Wizard', 'Legendary', 3, 120, 1.4, 'https://cdn.royaleapi.com/static/img/cards/ice-wizard.png'),
(145, 'Royal Giant', 'Common', 6, 505, 0.8, 'https://cdn.royaleapi.com/static/img/cards/royal-giant.png'),
(146, 'Guards', 'Epic', 3, 76, 2.1, 'https://cdn.royaleapi.com/static/img/cards/guards.png'),
(147, 'Princess', 'Legendary', 3, 451, 1.8, 'https://cdn.royaleapi.com/static/img/cards/princess.png'),
(148, 'Dark Prince', 'Epic', 4, 437, 2.4, 'https://cdn.royaleapi.com/static/img/cards/dark-prince.png'),
(149, 'Three Musketeers', 'Rare', 9, 295, 1.6, 'https://cdn.royaleapi.com/static/img/cards/three-musketeers.png'),
(150, 'Lava Hound', 'Legendary', 7, 223, 0.6, 'https://cdn.royaleapi.com/static/img/cards/lava-hound.png'),
(151, 'Ice Spirit', 'Common', 1, 132, 1.9, 'https://cdn.royaleapi.com/static/img/cards/ice-spirit.png'),
(152, 'Fire Spirit', 'Common', 1, 68, 0.6, 'https://cdn.royaleapi.com/static/img/cards/fire-spirit.png'),
(153, 'Miner', 'Legendary', 3, 153, 2.2, 'https://cdn.royaleapi.com/static/img/cards/miner.png'),
(154, 'Sparky', 'Legendary', 6, 359, 1.6, 'https://cdn.royaleapi.com/static/img/cards/sparky.png'),
(155, 'Bowler', 'Epic', 5, 488, 2, 'https://cdn.royaleapi.com/static/img/cards/bowler.png'),
(156, 'Lumberjack', 'Legendary', 4, 98, 1, 'https://cdn.royaleapi.com/static/img/cards/lumberjack.png'),
(157, 'Battle Ram', 'Rare', 4, 528, 0.6, 'https://cdn.royaleapi.com/static/img/cards/battle-ram.png'),
(158, 'Inferno Dragon', 'Legendary', 4, 205, 1.4, 'https://cdn.royaleapi.com/static/img/cards/inferno-dragon.png'),
(159, 'Ice Golem', 'Rare', 2, 189, 0.6, 'https://cdn.royaleapi.com/static/img/cards/ice-golem.png'),
(160, 'Mega Minion', 'Rare', 3, 298, 1.1, 'https://cdn.royaleapi.com/static/img/cards/mega-minion.png'),
(161, 'Dart Goblin', 'Rare', 3, 512, 2.1, 'https://cdn.royaleapi.com/static/img/cards/dart-goblin.png'),
(162, 'Goblin Gang', 'Common', 3, 101, 0.9, 'https://cdn.royaleapi.com/static/img/cards/goblin-gang.png'),
(163, 'Electro Wizard', 'Legendary', 4, 375, 1.8, 'https://cdn.royaleapi.com/static/img/cards/electro-wizard.png'),
(164, 'Elite Barbarians', 'Common', 6, 259, 0.6, 'https://cdn.royaleapi.com/static/img/cards/elite-barbarians.png'),
(165, 'Hunter', 'Epic', 4, 106, 1.2, 'https://cdn.royaleapi.com/static/img/cards/hunter.png'),
(166, 'Executioner', 'Epic', 5, 233, 2.1, 'https://cdn.royaleapi.com/static/img/cards/executioner.png'),
(167, 'Bandit', 'Legendary', 3, 537, 1.4, 'https://cdn.royaleapi.com/static/img/cards/bandit.png'),
(168, 'Royal Recruits', 'Common', 7, 156, 2.1, 'https://cdn.royaleapi.com/static/img/cards/royal-recruits.png'),
(169, 'Night Witch', 'Legendary', 4, 178, 2.4, 'https://cdn.royaleapi.com/static/img/cards/night-witch.png'),
(170, 'Bats', 'Common', 2, 542, 0.6, 'https://cdn.royaleapi.com/static/img/cards/bats.png'),
(171, 'Royal Ghost', 'Legendary', 3, 247, 2, 'https://cdn.royaleapi.com/static/img/cards/royal-ghost.png'),
(172, 'Ram Rider', 'Legendary', 5, 372, 2.3, 'https://cdn.royaleapi.com/static/img/cards/ram-rider.png'),
(173, 'Zappies', 'Rare', 4, 391, 1.8, 'https://cdn.royaleapi.com/static/img/cards/zappies.png'),
(174, 'Rascals', 'Common', 5, 132, 2.3, 'https://cdn.royaleapi.com/static/img/cards/rascals.png'),
(175, 'Cannon Cart', 'Epic', 5, 55, 1.2, 'https://cdn.royaleapi.com/static/img/cards/cannon-cart.png'),
(176, 'Mega Knight', 'Legendary', 7, 415, 1.7, 'https://cdn.royaleapi.com/static/img/cards/mega-knight.png'),
(177, 'Skeleton Barrel', 'Common', 3, 446, 0.8, 'https://cdn.royaleapi.com/static/img/cards/skeleton-barrel.png'),
(178, 'Flying Machine', 'Rare', 4, 295, 2.4, 'https://cdn.royaleapi.com/static/img/cards/flying-machine.png'),
(179, 'Wall Breakers', 'Epic', 2, 141, 0.7, 'https://cdn.royaleapi.com/static/img/cards/wall-breakers.png'),
(180, 'Royal Hogs', 'Rare', 5, 85, 2.5, 'https://cdn.royaleapi.com/static/img/cards/royal-hogs.png'),
(181, 'Goblin Giant', 'Epic', 6, 400, 1.6, 'https://cdn.royaleapi.com/static/img/cards/goblin-giant.png'),
(182, 'Fisherman', 'Legendary', 3, 391, 2, 'https://cdn.royaleapi.com/static/img/cards/fisherman.png'),
(183, 'Magic Archer', 'Legendary', 4, 387, 0.8, 'https://cdn.royaleapi.com/static/img/cards/magic-archer.png'),
(184, 'Electro Dragon', 'Epic', 5, 383, 2.3, 'https://cdn.royaleapi.com/static/img/cards/electro-dragon.png'),
(185, 'Firecracker', 'Common', 3, 346, 0.9, 'https://cdn.royaleapi.com/static/img/cards/firecracker.png'),
(186, 'Mighty Miner', 'Champion', 4, 183, 1.9, 'https://cdn.royaleapi.com/static/img/cards/mighty-miner.png'),
(187, 'Super Witch', 'Legendary', 6, 417, 1.6, 'https://cdn.royaleapi.com/static/img/cards/super-witch.png'),
(188, 'Elixir Golem', 'Rare', 3, 328, 0.8, 'https://cdn.royaleapi.com/static/img/cards/elixir-golem.png'),
(189, 'Battle Healer', 'Rare', 4, 536, 1.4, 'https://cdn.royaleapi.com/static/img/cards/battle-healer.png'),
(190, 'Skeleton King', 'Champion', 4, 277, 2.2, 'https://cdn.royaleapi.com/static/img/cards/skeleton-king.png'),
(191, 'Super Lava Hound', 'Legendary', 8, 496, 2.3, 'https://cdn.royaleapi.com/static/img/cards/super-lava-hound.png'),
(192, 'Super Magic Archer', 'Legendary', 5, 488, 1.8, 'https://cdn.royaleapi.com/static/img/cards/super-magic-archer.png'),
(193, 'Archer Queen', 'Champion', 5, 370, 1, 'https://cdn.royaleapi.com/static/img/cards/archer-queen.png'),
(194, 'Santa Hog Rider', 'Legendary', 5, 197, 2, 'https://cdn.royaleapi.com/static/img/cards/santa-hog-rider.png'),
(195, 'Golden Knight', 'Champion', 4, 472, 2.5, 'https://cdn.royaleapi.com/static/img/cards/golden-knight.png'),
(196, 'Super Ice Golem', 'Legendary', 4, 241, 2.4, 'https://cdn.royaleapi.com/static/img/cards/super-ice-golem.png'),
(197, 'Monk', 'Champion', 5, 396, 1.6, 'https://cdn.royaleapi.com/static/img/cards/monk.png'),
(198, 'Super Archers', 'Legendary', 3, 409, 2.3, 'https://cdn.royaleapi.com/static/img/cards/super-archers.png'),
(199, 'Skeleton Dragons', 'Common', 4, 267, 1.3, 'https://cdn.royaleapi.com/static/img/cards/skeleton-dragons.png'),
(200, 'Terry', 'Champion', 4, 435, 1.7, 'https://cdn.royaleapi.com/static/img/cards/terry.png'),
(201, 'Super Mini P.E.K.K.A', 'Legendary', 5, 421, 2.3, 'https://cdn.royaleapi.com/static/img/cards/super-mini-pekka.png'),
(202, 'Mother Witch', 'Legendary', 4, 147, 1.1, 'https://cdn.royaleapi.com/static/img/cards/mother-witch.png'),
(203, 'Electro Spirit', 'Common', 1, 57, 0.7, 'https://cdn.royaleapi.com/static/img/cards/electro-spirit.png'),
(204, 'Electro Giant', 'Epic', 7, 305, 0.9, 'https://cdn.royaleapi.com/static/img/cards/electro-giant.png'),
(205, 'Raging Prince', 'Epic', 5, 343, 1, 'https://cdn.royaleapi.com/static/img/cards/raging-prince.png'),
(206, 'Phoenix', 'Legendary', 4, 326, 2.5, 'https://cdn.royaleapi.com/static/img/cards/phoenix.png'),
(207, 'Cannon', 'Common', 3, 162, 0.9, 'https://cdn.royaleapi.com/static/img/cards/cannon.png'),
(208, 'Goblin Hut', 'Rare', 5, 198, 2.3, 'https://cdn.royaleapi.com/static/img/cards/goblin-hut.png'),
(209, 'Mortar', 'Common', 4, 356, 1.2, 'https://cdn.royaleapi.com/static/img/cards/mortar.png'),
(210, 'Inferno Tower', 'Rare', 5, 538, 2.1, 'https://cdn.royaleapi.com/static/img/cards/inferno-tower.png'),
(211, 'Bomb Tower', 'Rare', 4, 79, 2.3, 'https://cdn.royaleapi.com/static/img/cards/bomb-tower.png'),
(212, 'Barbarian Hut', 'Rare', 6, 218, 2.5, 'https://cdn.royaleapi.com/static/img/cards/barbarian-hut.png'),
(213, 'Tesla', 'Common', 4, 484, 1.3, 'https://cdn.royaleapi.com/static/img/cards/tesla.png'),
(214, 'Elixir Collector', 'Rare', 6, 282, 0.7, 'https://cdn.royaleapi.com/static/img/cards/elixir-collector.png'),
(215, 'X-Bow', 'Epic', 6, 57, 2.2, 'https://cdn.royaleapi.com/static/img/cards/x-bow.png'),
(216, 'Tombstone', 'Rare', 3, 103, 0.6, 'https://cdn.royaleapi.com/static/img/cards/tombstone.png'),
(217, 'Furnace', 'Rare', 4, 499, 1.2, 'https://cdn.royaleapi.com/static/img/cards/furnace.png'),
(218, 'Goblin Cage', 'Rare', 4, 114, 1.6, 'https://cdn.royaleapi.com/static/img/cards/goblin-cage.png'),
(219, 'Goblin Drill', 'Epic', 4, 226, 0.7, 'https://cdn.royaleapi.com/static/img/cards/goblin-drill.png'),
(220, 'Party Hut', 'Legendary', 5, 329, 1.3, 'https://cdn.royaleapi.com/static/img/cards/party-hut.png'),
(221, 'Fireball', 'Rare', 4, 260, 2.2, 'https://cdn.royaleapi.com/static/img/cards/fireball.png'),
(222, 'Arrows', 'Common', 3, 531, 1.1, 'https://cdn.royaleapi.com/static/img/cards/arrows.png'),
(223, 'Rage', 'Epic', 2, 313, 2.1, 'https://cdn.royaleapi.com/static/img/cards/rage.png'),
(224, 'Rocket', 'Rare', 6, 224, 1.3, 'https://cdn.royaleapi.com/static/img/cards/rocket.png'),
(225, 'Goblin Barrel', 'Epic', 3, 495, 1.1, 'https://cdn.royaleapi.com/static/img/cards/goblin-barrel.png'),
(226, 'Freeze', 'Epic', 4, 450, 0.7, 'https://cdn.royaleapi.com/static/img/cards/freeze.png'),
(227, 'Mirror', 'Epic', 1, 145, 1.7, 'https://cdn.royaleapi.com/static/img/cards/mirror.png'),
(228, 'Lightning', 'Epic', 6, 258, 1.1, 'https://cdn.royaleapi.com/static/img/cards/lightning.png'),
(229, 'Zap', 'Common', 2, 161, 1, 'https://cdn.royaleapi.com/static/img/cards/zap.png'),
(230, 'Poison', 'Epic', 4, 288, 1.9, 'https://cdn.royaleapi.com/static/img/cards/poison.png'),
(231, 'Graveyard', 'Legendary', 5, 68, 0.7, 'https://cdn.royaleapi.com/static/img/cards/graveyard.png'),
(232, 'The Log', 'Legendary', 2, 257, 2, 'https://cdn.royaleapi.com/static/img/cards/the-log.png'),
(233, 'Tornado', 'Epic', 3, 329, 1.5, 'https://cdn.royaleapi.com/static/img/cards/tornado.png'),
(234, 'Clone', 'Epic', 3, 490, 2.2, 'https://cdn.royaleapi.com/static/img/cards/clone.png'),
(235, 'Earthquake', 'Rare', 3, 407, 2.4, 'https://cdn.royaleapi.com/static/img/cards/earthquake.png'),
(236, 'Barbarian Barrel', 'Epic', 2, 370, 1.2, 'https://cdn.royaleapi.com/static/img/cards/barbarian-barrel.png'),
(237, 'Heal Spirit', 'Rare', 1, 430, 2.1, 'https://cdn.royaleapi.com/static/img/cards/heal-spirit.png'),
(238, 'Giant Snowball', 'Common', 2, 395, 0.6, 'https://cdn.royaleapi.com/static/img/cards/giant-snowball.png'),
(239, 'Royal Delivery', 'Common', 3, 186, 0.8, 'https://cdn.royaleapi.com/static/img/cards/royal-delivery.png'),
(240, 'Party Rocket', 'Legendary', 5, 528, 1.1, 'https://cdn.royaleapi.com/static/img/cards/party-rocket.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `paklik`
--

DROP TABLE IF EXISTS `paklik`;
CREATE TABLE `paklik` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `paklik`
--

INSERT INTO `paklik` (`id`, `user_id`) VALUES
(80, 20),
(110, 29);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `paklikartyak`
--

DROP TABLE IF EXISTS `paklikartyak`;
CREATE TABLE `paklikartyak` (
  `deck_id` int(10) UNSIGNED NOT NULL,
  `card_id` int(10) UNSIGNED NOT NULL,
  `slot_index` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `paklikartyak`
--

INSERT INTO `paklikartyak` (`deck_id`, `card_id`, `slot_index`) VALUES
(110, 2, 0),
(110, 11, 1),
(110, 6, 3),
(110, 12, 6);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`felhasznalonev`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A tábla indexei `kartyak`
--
ALTER TABLE `kartyak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `paklik`
--
ALTER TABLE `paklik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `decks_user_id_index` (`user_id`);

--
-- A tábla indexei `paklikartyak`
--
ALTER TABLE `paklikartyak`
  ADD KEY `deck_cards_deck_id_index` (`deck_id`),
  ADD KEY `deck_cards_card_id_index` (`card_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT a táblához `kartyak`
--
ALTER TABLE `kartyak`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT a táblához `paklik`
--
ALTER TABLE `paklik`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `paklikartyak`
--
ALTER TABLE `paklikartyak`
  ADD CONSTRAINT `deck_cards_card_id_foreign` FOREIGN KEY (`card_id`) REFERENCES `kartyak` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deck_cards_deck_id_foreign` FOREIGN KEY (`deck_id`) REFERENCES `paklik` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
