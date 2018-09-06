class Good
{
    constructor(id, name, title, price)
    {
        this.id = id;
        this.name = name;
        this.title = title;
        this.price = price;
    }

    render($jqueryElement)
    {
        let $goodContainer = $('<div/>', {
            class: 'good'
        });

        let $goodName = $('<h5/>', {
            text: this.name
        });

        let $goodTitle = $('<p/>', {
            text: this.title
        });

        let $goodPrice = $(`<p>Цена: <span class="product-price">${this.price}</span> руб.</p>`);

        let $goodBtn = $('<button/>', {
            class: 'buygood',
            text: 'Купить',
            'data-id': this.id
        });

        let $removeBtn = $('<button/>', {
            class: 'removeGood',
            text: 'Удалить',
            'data-id': this.id,
            'data-title': this.title
        });

        //Создаем структуру товара
        $goodName.appendTo($goodContainer);
        $goodTitle.appendTo($goodContainer);
        $goodPrice.appendTo($goodContainer);
        $goodBtn.appendTo($goodContainer);
        $removeBtn.appendTo($goodContainer);
        $jqueryElement.append($goodContainer);
    }

}
