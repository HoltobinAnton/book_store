$(document).on('turbolinks:load', function(){
  $('.active_button').on("click",function(){
    $("#btn_remove").attr('class', 'mb-20 btn btn-default');
  });
});