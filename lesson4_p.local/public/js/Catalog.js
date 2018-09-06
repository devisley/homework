class Catalog {

  constructor($container, renderItemsCount, basket) {
    let $div = $('<div/>', {
      class: 'container'
    });
    $container.append($div);
    this.$container = $div;
    this.renderItemsCount = renderItemsCount;
    this.basket = basket;
    this.lastItem = 0;
    this.$buttonShow = $('<button/>', {
      text: 'Show more',
    });
    this.listenersFlag = false;
    $container.append(this.$buttonShow);
    this.getGoods();
  }

  setRenderItemsCount(renderItemsCount) {
    this.renderItemsCount = renderItemsCount;
  }

  getGoods() {
    $.ajax({
      type: 'POST',
      url: '/goods/get',
      dataType: 'json',
      data: {
        "renderItemsCount": this.renderItemsCount,
        "lastItem": this.lastItem
      },
      context: this,
      success: function (data) {
        data.forEach(function (good) {
          let good1 = new Good(good['id'], good['name'], good['title'], good['price']);
          good1.render(this.$container);
        }.bind(this));

        if(!this.listenersFlag) {
          this.addEventListeners.call(this, this.basket);
          this.listenersFlag = true;
        }

        this.lastItem = data[data.length - 1]['id'];
      },
      error: function (error) {
        this.$container.text('Ошибка при получении списка товаров ' + error);
        console.log('Ошибка при получении списка товаров', error);
      }
    });
  }

  addEventListeners(basket) {

    this.$container.on('click', '.buygood', function () {
      let idProduct = parseInt($(this).attr('data-id'));
      let price = parseInt($(this).parent().find('.product-price').text());
      basket.add(idProduct, price);
    });

    this.$container.on('click', '.removeGood', function () {
      let idProduct = parseInt($(this).attr('data-id'));
      basket.remove(idProduct);
      console.log(idProduct);
    });

    this.$buttonShow.on('click', function () {
      this.getGoods();
    }.bind(this));
  }
}