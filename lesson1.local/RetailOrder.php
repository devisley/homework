<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 27.08.2018
 * Time: 23:07
 */

class RetailOrder extends Order
{
    private $userName;
    private $phoneNumber;
    private $email;
    private $discount = 0;

    public function __construct($number, $goods, $userName, $phoneNumber, $email, $discount)
    {
        parent::__construct($number, $goods);
        $this->userName = $userName;
        $this->phoneNumber = $phoneNumber;
        $this->email = $email;
        $this->discount = $discount;
    }

    public function getValue() {
        $value = parent::getValue();
        return $value - $value * $this->discount / 100;
    }
}