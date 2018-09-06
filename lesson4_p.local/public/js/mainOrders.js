$(document).ready(function () {

  //Заказы
  let $orders = $('#orders');
  getOrders($orders);

});


function getOrders($orders) {
  $.ajax({
    type: 'GET',
    url: '/basket/get',
    dataType: 'json',
    context: this,
    success: function (data) {
      let order = new Order(111111, data);
      order.render($orders);
      let basket = new Catalog('basket');
      basket.render($('.basket_wrapper'));

      addEventListeners($orders, basket);
    },
    error: function (error) {
      $orders.text('Ошибка при получении списка товаров ' + error);
      console.log('Ошибка при получении списка товаров', error);
    }
  });
}

function addEventListeners($orders, basket) {
  $orders.on('click', '.buygood', function () {
    let idProduct = parseInt($(this).attr('data-id'));
    let price = parseInt($(this).parent().find('.product-price').text());
    basket.add(idProduct, price, $(this));

  });

  $orders.on('click', '.removeGood', function () {
    let idProduct = parseInt($(this).attr('data-id'));
    basket.remove(idProduct, $(this));

  });
}