<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 27.08.2018
 * Time: 23:38
 */

require_once 'Good.php';
require_once 'Order.php';
require_once 'RetailOrder.php';
require_once 'WholesaleOrder.php';

$goods = [];

array_push($goods,
    new Good('Свитер', 3000, 1),
    new Good('Куртка', 8000, 1),
    new Good('Футболка', 1000, 2));

$retailOrderObj = new RetailOrder('12345678', $goods, 'Ivan Petrov', '89162341892', 'ivan@mail.ru', 5);

print('Розничный заказ № ' . $retailOrderObj->getNumber() . ' Цена: ' . $retailOrderObj->getValue() . "\n");

$goods = [];

array_push($goods,
    new Good('Свитер', 2000, 100),
    new Good('Куртка', 5200, 150),
    new Good('Футболка', 600, 200));

$wholesaleOrderObj = new WholesaleOrder('6767687868', $goods, 'АО "Рога и Копыта"', 'г. Москва, улю Баумана, д. г7',
    '12345687831', '23232323545', '22323', 'FRTDHG123938');

print('Оптовый заказ № ' . $wholesaleOrderObj->getNumber() . ' Цена: ' . $wholesaleOrderObj->getValue() . "\n");
