$(function(){

  $(".change-quantity").on("click", ".increase, .descrease", function(event){
    event.preventDefault();
    var item_id = $(this).parent().data("item-id");
    var product_id = $(this).parent().data("product-id");
    // var cart_id = $(this).parent().data("cart-id");
    // console.log('increase item ' + item_id + " " + product_id + " " + cart_id);
    var is_increase = $(this).hasClass("increase");

    console.log('is_increase ' + is_increase)
    
    $.ajax({
      url: "/cart/cart_item",
      method: "PATCH",
      data: { 
              item_id: item_id,
              product_id: product_id,
              is_increase: is_increase,
            },
      success: function(){
        console.log("item updated success..");
      },
      error: function() {
        console.log('item updated failure..');
      },
      complete: function() {
          console.log("updating cart...");
          $.ajax({
            url: "/cart-update",
            method: "PATCH",
            // data: "",
            success: function(){
              console.log("cart update successful..");
            },
            error: function() {
              console.log('cart update fail..');
            }
          });
      }
    });
  });
});