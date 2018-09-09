<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 09.09.2018
 * Time: 19:05
 */

class LoginController extends Controller
{

    public $view = 'login';

    public function index($data)
    {
        if(Auth::alreadyLoggedIn()){
            header('Location: /cabinet'); //Если пользователь успешно авторизован
        }

        //Если установлены куки, авторизуем через них
        if(Auth::checkAuthWithCookie()){
            header('Location: /cabinet'); //Если пользователь успешно авторизован
        }

        //Авторизуем по логину и паролю
        $autherror = '';
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            if(!Auth::authWithLoginPassword()){
                $autherror = 'Неправильный логин/пароль';
            } else {
                header('Location: /cabinet'); //Если пользователь успешно авторизован
            }
        }

        return [
          'autherror'  => $autherror
        ];
    }

    public function logout() {
        Auth::logOut();
    }
}