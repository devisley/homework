<?php
//Настройки

//Соединение с БД
define('HOST', 'localhost');
define('USER', 'lesson4p');
define('PASSWORD', 'lesson4p');
define('DB', 'lesson4p');
define('PORT', 3307);

//Еще какие-то настройки
define('SITE_TITLE', 'Название сайта v1');
define('SITE_ROOT', '../'); //Корень
define('TPL_DIR', SITE_ROOT . 'templates'); //Шаблоны
define('URL_ADMIN', '/admin');
define('LIB_DIR', SITE_ROOT . 'engine');

//Ошибки
define('ERROR_CODE_CONNECT', 1);
define('ERROR_NOT_FOUND', 2);
define('ERROR_TEMPLATE_EMPTY', 3);

require_once('../engine/autoload.php');