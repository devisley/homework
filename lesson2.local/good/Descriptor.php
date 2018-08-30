<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 30.08.2018
 * Time: 20:45
 */

namespace app\good;


trait Descriptor
{
    protected $id;
    protected $title;
    protected $manufacturer;

    private $isStocked = true;

    public function setStocked($isStocked) {
        $this->isStocked = $isStocked;
    }

}