$(document).on('turbolinks:load', function(){

  $('#checkbox_for_address').on("click",function() {
    if($('#checkbox_for_address').is(':checked')){
      clone_filds();
      setTimeout(function() { $(".hide_shipping_form").hide(); }, 500);
    }
    else{
      $('.hide_shipping_form').show();
    }
  });
    
  function clone_filds(){
    $("input[name='fname_ship']").val($("input[name='fname_bil']").val())
    $("input[name='lname_ship']").val($("input[name='lname_bil']").val())
    $("input[name='address_ship']").val($("input[name='address_bil']").val())
    $("input[name='city_ship']").val($("input[name='city_bil']").val())
    $("input[name='zip_ship']").val($("input[name='zip_bil']").val())
    $("select[name='country_ship']").val($("select[name='country_bil']").val())
    $("input[name='phone_ship']").val($("input[name='phone_bil']").val())
  }

});