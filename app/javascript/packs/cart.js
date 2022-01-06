$(function(){

  // $(".items-listing").on("click", ".increase, .descrease", function(){

  //   console.log("updating cart...")
    
  //   $.ajax({
  //     url: "/cart-update",
  //     method: "PATCH",
  //     // data: "",
  //     success: function(){
  //       console.log("cart update successful..");
  //     },
  //     error: function() {
  //       console.log('cart update fail..')
  //     }
  //   })  
  // });


  $(".checkbox").bind('change', function(){
    var checkboxID = $(this).data("checkbox-id");
    var is_checked = this.checked ? true : false;
    
    console.log(is_checked)

    $.ajax({
      url: "/cart-update",
      method: "PATCH",
      data: {
              item_id: checkboxID,
              is_checked: is_checked
            },
      success: function(){
        console.log("cart update successful..");
      },
      error: function() {
        console.log('cart update fail..')
      }
    })  
  });

});