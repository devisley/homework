<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 30.08.2018
 * Time: 20:07
 */

namespace app\good;


abstract class Good {

    abstract protected function getValue();

    public function showValue() {
        echo "Value = {$this->getValue()} \n";
    }
}