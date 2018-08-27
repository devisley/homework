<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 27.08.2018
 * Time: 22:35
 */

class Order
{
    private $number = '00000000';
    private $goods = [];

    public function __construct($number, $goods) {
        $this->number = $number;
        $this->goods = $goods;
    }

    function getNumber() {
        return $this->number;
    }

    function getGoods() {
        return $this->goods;
    }

    function setNumber($number) {
        $this->number = $number;
    }

    function setGoods($goods) {
        $this->goods=$goods;
    }

    function addGood($good) {
        array_push($this->goods, $good);
    }

    function getValue() {
        $value = 0;
        foreach ($this->goods as $good) {
            $value += $good->getValue();
        }

        return $value;
    }

//    private $discount = 0;


}