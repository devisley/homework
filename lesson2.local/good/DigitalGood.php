<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 30.08.2018
 * Time: 20:09
 */

namespace app\good;


class DigitalGood extends OrdinaryGood {

    public function __construct($value, $id, $title, $manufacturer)
    {
        parent::__construct($value, $id, $title, $manufacturer);
    }

    protected function getValue() : float {
        return floatval(parent::getValue() / 2);
    }
}