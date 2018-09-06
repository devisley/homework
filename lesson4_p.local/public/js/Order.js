class Order {
  constructor (id, dbBasket) {
    this.id = id;
    this.price = dbBasket.amount;
    this.items = this.getOrderItems(dbBasket.basket);
  }

  getOrderItems(items) {
    let itemsArray = [];

    items.forEach(function (item) {
      let find = itemsArray.find(function (element, index, array) {
        if (element['id_product'] === item['id_product']) {
          array[index]['count'] += 1;
          return true;
        }
      });

      if (!find) {
        let newItem = {
          'id_product': item['id_product'],
          'count': 1,
          'price': item['price']
        };

        itemsArray.push(newItem);
      }
    });

    // console.log(itemsArray);
    return itemsArray;
  }

  render($jqueryElement)
  {
    let $orderContainer = $('<div/>', {
      class: 'good'
    });

    let $orderTitle = $('<p/>', {
      text: 'Заказ № ' + this.id
    });

    let $orderPrice = $('<div/>', {
      class: 'basket_wrapper'
    });

    let $orderHeader = $('<h3/>', {
      text: 'Товары:'
    });

    let $orderElements = this.getRenderOrderItems();

    //Создаем структуру товара
    $orderTitle.appendTo($orderContainer);
    $orderPrice.appendTo($orderContainer);
    $orderHeader.appendTo($orderContainer);

    //Рендерим жлементы заказа
    $orderElements.appendTo($orderContainer);

    $jqueryElement.append($orderContainer);
  }

  getRenderOrderItems() {
    let $container = $('<div/>');

    this.items.forEach(function (orderItem) {
      let $goodContainer = $('<div/>', {
        class: 'good'
      });

      let $goodTitle = $('<p/>', {
        text: 'ID товара: ' + orderItem['id_product']
      });

      let $goodCount= $('<p/>', {
        text: 'Количество, шт: '
      });

      $goodCount.append($('<span/>', {
        class: 'count',
        text: orderItem['count'],
        'data-count': orderItem['count']
      }));

      let $goodPrice = $(`<p>Цена за шт: <span class="product-price">${orderItem['price']}</span> руб.</p>`);

      let $goodBtn = $('<button/>', {
        class: 'buygood',
        text: 'Добавить',
        'data-id': orderItem['id_product']
      });

      let $removeBtn = $('<button/>', {
        class: 'removeGood',
        text: 'Удалить',
        'data-id': orderItem['id_product'],
      });

      //Создаем структуру товара
      $goodTitle.appendTo($goodContainer);
      $goodCount.appendTo($goodContainer);
      $goodPrice.appendTo($goodContainer);
      $goodBtn.appendTo($goodContainer);
      $removeBtn.appendTo($goodContainer);

      $goodContainer.appendTo($container);
    });

    return $container;
  }

}