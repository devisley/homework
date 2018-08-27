<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 28.08.2018
 * Time: 0:13
 */

class A {
    public function foo() {
        static $x = 0;
        echo ++$x;
    }
}
class B extends A {
}
$a1 = new A();
$b1 = new B();
$a1->foo();//1
$b1->foo();//1
$a1->foo();//2
$b1->foo();//2

/*
 * В данном примере, в отличие от предыдущего, метод foo вызывается из разных классов A и B. У каждого класса свой набор
 * статических свойств и методов, поэтому выведется '1122'.
 */
