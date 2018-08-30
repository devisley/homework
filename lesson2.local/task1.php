<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 30.08.2018
 * Time: 19:25
 */

namespace app;

spl_autoload_register(function($class) {
    $pathArray = explode('\\', $class);
    $path = $pathArray[1] . '/' . $pathArray[2] . '.php';
    require_once $path;
});

use app\good\Good;
use app\good\OrdinaryGood;
use app\good\DigitalGood;
use app\good\WeightGood;

$keyboard = new OrdinaryGood(500, '12345', 'Клавиатура Microsoft', 'China');
echo $keyboard;

$ebook = new DigitalGood(500, '343545', 'Приключения Буратино', 'МосЛитРес');
echo $ebook;

$potato = new WeightGood(40, '193923', 'Картофель ранний', 'Беларусь', 200);
echo $potato;

$potato->setStocked(false);
echo $potato;
