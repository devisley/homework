<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 03.09.2018
 * Time: 21:34
 */

namespace app\gallery;

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

class DatabaseConnector
{
    public $settings = [];

    public function __construct()
    {
        //Защищаем констрктор
    }

    public function __clone()
    {
        // Защищаем clone
    }

    public function __wakeup()
    {
        // Защищаем wakeup
    }

    function getAssocResult($sql)
    {
        $mysqli = mysqli_connect($this->settings['host'], $this->settings['user'], $this->settings['password'], $this->settings['db'], $this->settings['port']);

        //Проверить, удалось ли соединиться с базой данных
        if(mysqli_connect_errno()){
            echo 'Не удалось установить соединение с БД. Ошибка: ' . mysqli_connect_error().PHP_EOL;
            exit(ERROR_CODE_CONNECT);
        }

        $result = mysqli_query($mysqli, $sql);
        $arrayResult = []; //Для уже полученных данных

        while ($row = mysqli_fetch_assoc($result))
        {
            array_push($arrayResult, $row);
        }
        mysqli_close($mysqli);
        return $arrayResult;
    }

    function getConnection()
    {
        $mysqli = mysqli_connect($this->settings['host'], $this->settings['user'], $this->settings['password'], $this->settings['db'], $this->settings['port']);
        return $mysqli;
    }

    function executeQuery($sql, $db = null)
    {
        if($db === null){
            $db = $this->getConnection();
        }

        $result = mysqli_query($db, $sql);
        mysqli_close($db);
        return $result;
    }

    function getRowResult($sql){
        $array = $this->getAssocResult($sql);

        if(isset($array[0])){
            $result = $array[0];
        } else {
            $result = [];
        }
        return $result;
    }
}

trait DatabaseConnectorSingleton
{
    private static $instance;

    // Возвращает единственный экземпляр класса. @return DatabaseConnectorSingleton
    public static function getInstance($host, $user, $password, $db, $port) {
        if ( empty(self::$instance) ) {
            self::$instance = new DatabaseConnector();
            self::$instance->settings['host'] = $host;
            self::$instance->settings['user'] = $user;
            self::$instance->settings['password'] = $password;
            self::$instance->settings['db'] = $db;
            self::$instance->settings['port'] = $port;
        }

        return self::$instance;
    }
}