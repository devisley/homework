<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 30.08.2018
 * Time: 20:08
 */

namespace app\good;


class OrdinaryGood extends Good {
    private $value;

    use Descriptor;

    public function __construct($value, $id, $title, $manufacturer) {
        $this->value = $value;
        $this->id = $id;
        $this->title = $title;
        $this->manufacturer = $manufacturer;
    }

    protected function getValue() {
        return $this->value;
    }

    public function __toString()
    {
        $info = "-----------\n";
        $info .=
            "ID: {$this->id} \n" .
            "Title: {$this->title} \n" .
            "Manufacturer: {$this->manufacturer} \n" .
            "Value: {$this->getValue()} \n";

        $info .= ($this->isStocked) ? 'Товар в наличии' : 'Товара нет на складе';

        return $info . "\n" . "-----------" . "\n";
    }
}