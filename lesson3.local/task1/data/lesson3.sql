-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Сен 03 2018 г., 23:50
-- Версия сервера: 5.7.20
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lesson3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `src` varchar(200) NOT NULL,
  `src_thumb` varchar(200) NOT NULL,
  `title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `src`, `src_thumb`, `title`) VALUES
(1, 'img/pic1.jpg', 'thumb/pic1.jpg', 'Картинка природы 1'),
(2, 'img/pic2.jpg', 'thumb/pic2.jpg', 'Картинка природы 2'),
(3, 'img/pic3.jpg', 'thumb/pic3.jpg', 'Картинка природы 3'),
(4, 'img/pic4.jpg', 'thumb/pic4.jpg', 'Картинка природы 4'),
(5, 'img/pic5.jpg', 'thumb/pic5.jpg', 'Картинка природы 5'),
(6, 'img/pic6.jpg', 'thumb/pic6.jpg', 'Картинка природы 6'),
(7, 'img/pic7.jpg', 'thumb/pic7.jpg', 'Картинка природы 7'),
(8, 'img/pic8.jpg', 'thumb/pic8.jpg', 'Картинка природы 8');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
