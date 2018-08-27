<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 27.08.2018
 * Time: 22:59
 */

class WholesaleOrder extends Order
{
    private $companyName;
    private $legalAddress;
    private $OGRN = '0000000000000';
    private $INN = '0000000000';
    private $KPP = '000000000';
    private $registryCode;

    public function __construct($number, $goods, $companyName, $legalAddress, $OGRN, $INN, $KPP, $registryCode)
    {
        parent::__construct($number, $goods);
        $this->companyName = $companyName;
        $this->legalAddress = $legalAddress;
        $this->OGRN = $OGRN;
        $this->INN = $INN;
        $this->KPP = $KPP;
        $this->registryCode = $registryCode;
    }
}