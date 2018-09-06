$(document).ready(function () {

  //Корзина
  let basket = new Basket('basket');
  basket.render($('#basket_wrapper'));

  //Товары
  let $goods = $('#goods');
  $goods.append(`<h2>Список товаров</h2>`);
  let catalog = new Catalog($goods, 25, basket);
});
