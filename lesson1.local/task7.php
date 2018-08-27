<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 28.08.2018
 * Time: 0:17
 */

class A {
    public function foo() {
        static $x = 0;
        echo ++$x;
    }
}
class B extends A {
}
$a1 = new A;
$b1 = new B;
$a1->foo();//1
$b1->foo();//1
$a1->foo();//2
$b1->foo();//2

/*
 * Чет не понял прикола, видимо ошибка в методичке, тут все как в task6 только при вызове конструкторов не стоит скобочек.
 * Если конструктор вызывается без параметров то скобки дропускается не ставить.
 */