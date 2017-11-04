$( document ).on('turbolinks:load', function() {
  
  $('.quantity-input').focusout(function(){
    var value = $(this).val();
    var id = $(this).attr('class').substring(24,26)
    var error = 'The value must be an integer 1..99'
    if( !parseInt(value)){
        alert(error)
        value = 1}
    if (value < 1 || value > 99){
      alert(error)
      value = 1}

    $.ajax({
      type: "PUT",
      url: '/order_items/' + id,
      data: {  quantity: value }

    })
  });

});