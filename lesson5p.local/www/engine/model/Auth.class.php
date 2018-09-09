<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 09.09.2018
 * Time: 18:37
 */

class Auth extends Model {

    protected static $table = 'user';

    protected static function setProperties()
    {
        self::$properties['id'] = [
            'type' => 'int',
            'autoincrement' => true,
        ];

        self::$properties['user_name'] = [
            'type' => 'varchar',
            'size' => 50
        ];

        self::$properties['user_login'] = [
            'type' => 'varchar',
            'size' => 50
        ];

        self::$properties['user_password'] = [
            'type' => 'varchar',
            'size' => 60
        ];

        self::$properties['user_last_action'] = [
            'type' => 'timestamp',
        ];
    }

    public static function alreadyLoggedIn() {
        return isset($_SESSION['user']);
    }

    public static function checkAuthWithCookie()
    {
        if (isset($_COOKIE['id_user']) && isset($_COOKIE['cookie_hash'])){
            //Получаем данные пользователя по ID
            $userData = db::getInstance()->Select(
                'SELECT id_user, user_login, user_password FROM user WHERE id_user = :id_user',
                ['id_user' => (int)$_COOKIE['id_user']]);

            if(($userData['user_password'] !== $_COOKIE['cookie_hash']) || ($userData['id_user'] !== $_COOKIE['id_user'])){
                setcookie('id_user', '', time() - 3600 * 24, '/');
                setcookie('cookie_hash', '', time() - 3600 * 24, '/');
            } else {
                header('Location: /'); //Все в порядке, пользователь авторизовался через cookie
            }
        }
        return false;
    }

    public static function authWithLoginPassword()
    {
        $username = $_POST['login'];
        $password = $_POST['password'];

        //Получаем данные по логину
        $userData = db::getInstance()->Select(
            'SELECT * FROM user WHERE user_login = :user_login',
            ['user_login' => $username]);
        $userData = $userData[0];

        $isAuth = 0;

        //Проверяем соответствие логина и пароля
        if($userData){
            if(self::checkPassword($password, $userData['user_password'])){
                $isAuth = 1; //Авторизован
            }
        }

        if (isset($_POST['remember_me'])){
            setcookie('id_user', $userData['id_user'], time() + 3600 * 24, '/');
            setcookie('cookie_hash', $userData['user_password'], time() + 3600 * 24, '/');
        }

        //Сохраняем данные в сессии
        $_SESSION['user'] = $userData;
        return $isAuth;
    }

    private static function checkPassword($password, $hash)
    {
        return md5($password) === $hash;
    }

    public static function logOut() {
        $_SESSION = [];
        $_POST = [];
        $_GET = [];
        $_COOKIE = [];
        header('Location: /login');
    }

}