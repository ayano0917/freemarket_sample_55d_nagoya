$(document).on('turbolinks:load', function () {
  let ItemPrice = $("#item_price")
  let ItemFee = $(".sell-form__fee")
  let ItemProfit = $(".sell-form__gain")

  function Calculation() {
    if (ItemPrice.val() < 300 || ItemPrice.val() > 9999999) {
      ItemFee.text('-');
      ItemProfit.text('-');
    } else {
      let SellingPrice = ItemPrice.val();
      let SellingFee = String(Math.floor(SellingPrice * 0.1)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      let SellingProfit = String(Math.floor(SellingPrice * 0.9)).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      ItemFee.text('¥' + SellingFee);
      ItemProfit.text('¥' + SellingProfit);
    }
  }
  
    $(window).on('load', function() {
      if ( document.URL.match(/^(?=.*items)(?=.*edit)/)){
        Calculation();
      } 
    });

    ItemPrice.on("keyup", function () {
      Calculation();
    });
  
}); 