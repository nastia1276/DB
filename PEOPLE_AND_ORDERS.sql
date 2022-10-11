-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Час створення: Жов 11 2022 р., 10:36
-- Версія сервера: 5.7.30
-- Версія PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `PEOPLE_AND_ORDERS`
--

-- --------------------------------------------------------

--
-- Структура таблиці `Goods`
--

CREATE TABLE `Goods` (
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` float DEFAULT NULL,
  `Good_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `Goods`
--

INSERT INTO `Goods` (`Name`, `Price`, `Good_ID`) VALUES
('Device', 30, 1),
('Food', 15, 2),
('House', 1000, 3),
('Water', 5, 4);

-- --------------------------------------------------------

--
-- Структура таблиці `Grouped_orders`
--

CREATE TABLE `Grouped_orders` (
  `People` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Goods` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `Grouped_orders`
--

INSERT INTO `Grouped_orders` (`People`, `Goods`) VALUES
('Dell', 'Food, House'),
('Jhon', 'Water');

-- --------------------------------------------------------

--
-- Структура таблиці `Orders`
--

CREATE TABLE `Orders` (
  `Date` date DEFAULT NULL,
  `People` int(11) DEFAULT NULL,
  `Good` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `Orders`
--

INSERT INTO `Orders` (`Date`, `People`, `Good`) VALUES
('2022-10-11', 1, 2),
('2022-10-11', 1, 3),
('2022-10-11', 2, 4);

-- --------------------------------------------------------

--
-- Структура таблиці `People`
--

CREATE TABLE `People` (
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `People_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `People`
--

INSERT INTO `People` (`Name`, `Surname`, `Birthday`, `People_ID`) VALUES
('Dell', 'Camp', '1967-09-12', 1),
('Jhon', 'Doo', '1998-09-05', 2),
('Sally', 'Vinh', '1968-11-16', 3),
('Tom', 'Billy', '2020-11-09', 4);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `Goods`
--
ALTER TABLE `Goods`
  ADD PRIMARY KEY (`Good_ID`);

--
-- Індекси таблиці `Orders`
--
ALTER TABLE `Orders`
  ADD KEY `People` (`People`),
  ADD KEY `Good` (`Good`);

--
-- Індекси таблиці `People`
--
ALTER TABLE `People`
  ADD PRIMARY KEY (`People_ID`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `Goods`
--
ALTER TABLE `Goods`
  MODIFY `Good_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `People`
--
ALTER TABLE `People`
  MODIFY `People_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`People`) REFERENCES `People` (`People_ID`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`Good`) REFERENCES `Goods` (`Good_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
