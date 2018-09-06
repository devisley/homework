<?php


//Получение добавленных товаров
function getBasket()
{
    $sql = 'SELECT * FROM basket';
    $basket = getAssocResult($sql);
    return $basket;
}

function getBasketAmount($basket)
{
    $amount = 0;
    foreach ($basket as $item)
    {
        $amount += $item['price'];
    }
    return $amount;
}

function addGoodBasket($idProduct, $price)
{
    $dbLink = getConnection();

    $idProduct = mysqli_real_escape_string($dbLink, htmlspecialchars(strip_tags($idProduct)));
    $price = mysqli_real_escape_string($dbLink, htmlspecialchars(strip_tags($price)));

    $sql = "INSERT INTO basket (`id_product`, `count`, `price`) VALUES (\"$idProduct\", \"1\", \"$price\")";
    $res = executeQuery($sql, $dbLink);

    if(!$res){
        $response = ['result' => false];
    } else {
        $response = ['result' => true];
    }

    return $response;
}

function removeGoodBasket($idProduct) {
    $dbLink = getConnection();

    $idProduct = mysqli_real_escape_string($dbLink, htmlspecialchars(strip_tags($idProduct)));

    $sql = "DELETE FROM basket WHERE id_product='". $idProduct ."' LIMIT 1";
    $res = executeQuery($sql, $dbLink);

    if(!$res){
        $response = ['result' => false];
    } else {
        $response = ['result' => true];
    }

    return $response;
}

function getGoods() {
    $lastItem = 0;
    $renderItemsCount = 10;

    if (isset($_POST['renderItemsCount']) && isset($_POST['lastItem'])) {
        $lastItem = $_POST['lastItem'];
        $renderItemsCount = $_POST['renderItemsCount'];
    }

    $sql = 'SELECT * FROM goods where id>' . $lastItem . ' limit ' . $renderItemsCount;
//    $sql = 'select * from goods';
    $goods = getAssocResult($sql);
    return $goods;
}