<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 30.08.2018
 * Time: 20:09
 */

namespace app\good;


class WeightGood extends OrdinaryGood {
    private $weight;

    public function __construct($value, $id, $title, $manufacturer, $weight)
    {
        $this->weight = $weight;
        parent::__construct($this->calculateValue($value), $id, $title, $manufacturer);
    }

    /**
     * Формирование цены в зависимости от веса заказа. Фиксированная скидка 15% при оптовой покупке от 100 кг.
     * @param $value - Цена за кг по умолчанию.
     * @return float - Новая цена.
     */
    protected function calculateValue($value) : float {
        $koef = 1;

        if ($this->weight >= 10 && $this->weight < 100) {
            $koef -= $this->weight / 1000;
        } else if ($this->weight >= 100) {
            $koef -= 0.15;
        }

        return floatval($value * $koef);
    }
}