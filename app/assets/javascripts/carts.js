function addItem(item) {
    console.log('+1');
    $.post('cart_items/plus', {
      item: item
    })
  }

  function removeItem(item) {
    console.log('-1');
    $.post('cart_items/minus', {
      item: item
    })
  }

