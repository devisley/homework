<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 27.08.2018
 * Time: 22:36
 */

class Good
{
    private $name = 'undefined';
    private $price = 0;
    private $count = 0;

    public function __construct($name, $price, $count) {
        $this->name = $name;
        $this->price = $price;
        $this->count = $count;
    }

    function getValue() {
        return $this->price * $this->count;
    }

    function getName() {
        return $this->name;
    }

    function setPrice($price) {
        $this->price = $price;
    }

    function setName($name) {
        $this->name = $name;
    }

    function addGood($count = 1) {
        $this->count += $count;
    }
}