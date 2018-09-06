class Basket {
  constructor(idBasket) {
    this.id = idBasket;

    //this.countGoods = 0; //Общее количество товаров
    this.amount = 0; //Общая стоимость товаров
    this.basketItems = []; //Массив для хранения товаров
    this.ajaxGetItems(); //Получение уже добавленных товаров
  }

  render($jQueryElement) {
    let $basketDiv = $('<div/>', {
      id: this.id,
    });

    $basketDiv.append(`<h3>Корзина</h3>`);

    let $basketItemsDiv = $('<div/>', {
      id: this.id + '_items'
    });

    $basketItemsDiv.appendTo($basketDiv);
    $basketDiv.appendTo($jQueryElement);
  }

  ajaxGetItems() {
    let appendId = `#${this.id}_items`;
    //let self = this;
    $.ajax({
      type: 'GET',
      url: '/basket/get',
      dataType: 'json',
      context: this,
      success: function (data) {
        //console.log('basket:', data);
        let $basketData = $('<div/>', {
          id: 'basket_data'
        });

        this.amount = data.amount;
        for (let i = 0; i < data.basket.length; i++) {
          this.basketItems.push(data.basket[i]);
        }

        $basketData.append(`<p>Всего товаров: ${this.basketItems.length}</p>`);
        $basketData.append(`<p>Общая сумма: ${this.amount} руб.</p>`);
        $basketData.appendTo(appendId);
      },
      error: function (error) {
        console.log('Ошибка при получении содержимого корзины', error);
      }
    });
  }

  add(idProduct, price, elem) {
    let basketItems = {
      "id_product": idProduct,
      price //price: price
    };

    //AJAX
    this.addProductAjax(basketItems, elem);

    this.basketItems.push(basketItems);
    this.amount += price; //this.amount = this.amount + price;
    this.refresh(); //Перерисовываем корзину
  }

  addProductAjax(data, elem) {
    $.ajax({
      url: '/basket/add',
      type: 'POST',
      dataType: 'json',
      data,
      error: function (err) {
        console.log('Ошибка', err);
      },
      success: function (data) {
        console.log('Товар добавлен', data);
        if (elem) {
          let $elem = elem.parent().find('.count');
          let count = +$elem.attr('data-count');
          if (count) {
            $elem.attr('data-count', count + 1);
            $elem.text(count + 1);
          }
        }
        if (data.result) {
          alert('Товар успешно добавлен в корзину');
        } else {
          alert('Не удалось добавить товар в корзину. Повторите попытку позже.');
        }
      }
    });
  }

  removeProductAjax(data, elem) {
    $.ajax({
      url: '/basket/remove',
      type: 'POST',
      dataType: 'json',
      data,
      error: function (err) {
        console.log('Ошибка', err);
      },
      success: function (data) {
        console.log('Товар удален', data);
        if (elem) {
          let $elem = elem.parent().find('.count');
          let count = +$elem.attr('data-count');
          if (count - 1) {
            $elem.attr('data-count', count - 1);
            $elem.text(count - 1);
          } else {
            elem.parent().remove();
          }
        }
        if (data.result) {
          alert('Товар успешно удален из корзины');
        } else {
          alert('Не удалось удалить товар из корзины. Повторите попытку позже.');
        }
      }
    });
  }


  remove(idProduct, elem) {
    let basketItems = {
      "id_product": idProduct
    };

    //AJAX
    this.removeProductAjax(basketItems, elem);

    for (let item of this.basketItems) {
      if (item.id_product == idProduct) {
        let itemIndex = this.basketItems.indexOf(item);
        this.basketItems.splice(itemIndex, 1);
        this.amount -= item.price;
        break;
      }
    }
    this.refresh();
  }

  refresh() {
    let $basketDataDiv = $('#basket_data');
    $basketDataDiv.empty(); //Очищаем содержимое контейнера
    $basketDataDiv.append(`<p>Всего товаров: ${this.basketItems.length}</p>`);
    $basketDataDiv.append(`<p>Общая сумма: ${this.amount} руб.</p>`);
  }
}