<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 30.08.2018
 * Time: 22:27
 */

trait SingletonTrait {
    private static $instance;

    // Возвращает единственный экземпляр класса. @return Singleton
    public static function getInstance() {
        if ( empty(self::$instance) ) {
            self::$instance = new Singleton();
        }
        return self::$instance;
    }
}

class Singleton {

    public function doAction() {
        echo 'Action';
    } //Функционал

}

SingletonTrait::getInstance()->doAction();
