<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 09.09.2018
 * Time: 20:05
 */

class CabinetController extends Controller {
    public $view = 'cabinet';

    public function index($data)
    {
       if (!Auth::alreadyLoggedIn()) {
           header('Location: /login');
       }

       return [
           'pages' => $_SESSION['last_pages'],
       ];
    }
}