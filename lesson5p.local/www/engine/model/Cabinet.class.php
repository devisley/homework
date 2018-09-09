<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 09.09.2018
 * Time: 23:21
 */

class Cabinet extends Model {
    public static function updateSession($url) {

        if ($url && $url !== 'cabinet' && $url !== 'login') {
            if (isset($_SESSION['last_pages'])) {
                $pages = $_SESSION['last_pages'];
            } else {
                for ($i = 0; $i < 5; $i++) {
                    $pages[$i] = '';
                }
            }
            array_unshift($pages, $url);
            array_pop($pages);

            $_SESSION['last_pages'] = $pages;
        }
    }
}