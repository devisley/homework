-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Сен 07 2018 г., 00:57
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
-- База данных: `lesson4p`
--

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `id_basket` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`id_basket`, `id_product`, `count`, `price`) VALUES
(64, 2, 1, 83),
(68, 1, 1, 73),
(69, 25, 1, 80),
(70, 2, 1, 83),
(71, 2, 1, 83);

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` text,
  `title` text,
  `price` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `title`, `price`) VALUES
(1, 'et', 'Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget', 73),
(2, 'vel', 'nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies', 83),
(3, 'sapien.', 'luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis,', 98),
(4, 'feugiat', 'Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget', 98),
(5, 'mauris,', 'per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.', 95),
(6, 'velit', 'Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.', 83),
(7, 'Fusce', 'nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna', 83),
(8, 'turpis', 'eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent', 66),
(9, 'facilisis', 'varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede', 72),
(10, 'ante', 'In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.', 80),
(11, 'fringilla', 'lacus pede sagittis augue, eu tempor erat neque non quam.', 89),
(12, 'per', 'sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer', 98),
(13, 'est', 'hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec', 91),
(14, 'libero.', 'quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla.', 97),
(15, 'elit', 'dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras', 100),
(16, 'dis', 'mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus', 60),
(17, 'Sed', 'arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris', 92),
(18, 'tortor.', 'Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit', 95),
(19, 'nec,', 'at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque', 86),
(20, 'quam', 'Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec', 73),
(21, 'ante', 'Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,', 71),
(22, 'tempor', 'Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at,', 96),
(23, 'Suspendisse', 'massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce', 85),
(24, 'Nunc', 'ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse', 74),
(25, 'luctus', 'Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante', 80),
(26, 'egestas', 'diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus', 76),
(27, 'lacinia', 'sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue', 84),
(28, 'habitant', 'Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla', 85),
(29, 'Cras', 'Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at,', 87),
(30, 'Integer', 'Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla', 65),
(31, 'odio', 'elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus', 72),
(32, 'risus.', 'eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit', 91),
(33, 'pede.', 'molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet', 61),
(34, 'et,', 'senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi', 98),
(35, 'urna', 'nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis', 90),
(36, 'Vivamus', 'ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class', 80),
(37, 'quam', 'nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero.', 65),
(38, 'vel', 'Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit', 70),
(39, 'nec,', 'id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla', 92),
(40, 'nec', 'dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus', 70),
(41, 'Sed', 'sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit', 82),
(42, 'Maecenas', 'sit amet, faucibus ut, nulla. Cras eu tellus eu augue', 78),
(43, 'auctor', 'dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper', 76),
(44, 'quis', 'urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices', 80),
(45, 'mauris', 'enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus', 74),
(46, 'semper', 'Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum', 61),
(47, 'ante', 'Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh', 92),
(48, 'purus', 'diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus', 71),
(49, 'elit,', 'vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor', 98),
(50, 'scelerisque,', 'eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit', 64),
(51, 'tristique', 'ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor', 90),
(52, 'orci', 'feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa.', 61),
(53, 'laoreet,', 'Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam', 62),
(54, 'vitae', 'risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum', 83),
(55, 'nulla.', 'ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi,', 88),
(56, 'risus.', 'vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,', 81),
(57, 'per', 'et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a', 92),
(58, 'Nulla', 'adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet', 94),
(59, 'et', 'Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet.', 73),
(60, 'Quisque', 'non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante.', 77),
(61, 'Donec', 'tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius', 61),
(62, 'auctor', 'diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec', 70),
(63, 'vel', 'Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem', 62),
(64, 'sapien.', 'laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur', 77),
(65, 'ipsum', 'vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci', 93),
(66, 'est,', 'imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec', 66),
(67, 'Vestibulum', 'vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur', 64),
(68, 'nascetur', 'commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc,', 86),
(69, 'vitae,', 'Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas', 88),
(70, 'metus', 'sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae', 65),
(71, 'a,', 'Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc', 97),
(72, 'egestas', 'eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris', 98),
(73, 'ac,', 'elit fermentum risus, at fringilla purus mauris a nunc. In at', 64),
(74, 'adipiscing', 'vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam', 67),
(75, 'aliquet', 'vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus.', 79),
(76, 'turpis', 'ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit', 65),
(77, 'convallis', 'dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi,', 90),
(78, 'nulla.', 'adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet', 98),
(79, 'enim', 'lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos', 81),
(80, 'vulputate', 'nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris', 92),
(81, 'semper', 'et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse', 61),
(82, 'Suspendisse', 'et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique', 85),
(83, 'fringilla', 'Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit', 66),
(84, 'Praesent', 'turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor', 99),
(85, 'feugiat.', 'pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod', 73),
(86, 'Vivamus', 'nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum', 61),
(87, 'rutrum', 'a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec,', 73),
(88, 'nonummy', 'pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit', 88),
(89, 'Vestibulum', 'malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel,', 77),
(90, 'dolor', 'at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac', 96),
(91, 'velit.', 'nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque', 97),
(92, 'erat,', 'cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec', 76),
(93, 'magna.', 'vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum', 61),
(94, 'Nunc', 'ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,', 95),
(95, 'magna.', 'est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut,', 81),
(96, 'malesuada', 'eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum,', 71),
(97, 'laoreet', 'Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper', 96),
(98, 'faucibus.', 'Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque', 87),
(99, 'libero', 'amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget', 69),
(100, 'netus', 'ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim', 69);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id_basket`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `id_basket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
