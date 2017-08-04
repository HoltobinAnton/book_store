$( document ).on('turbolinks:load', function() {
    
    /*$("#click_plus").on("click",function() {
    incrementVal($('#value_text_field'));
    }); 
    

    function incrementVal(selector) {
    var $item = selector;
    var $curVal = $item.attr("value");
    $item.attr("value", parseInt($curVal) + 1 );
    }*/

    $('#value_text_field').focusout(function(){
        var value = $(this).val();
        var error = 'The value must be an integer 1..99'
        if( !parseInt(value)){
            alert(error);
            value = 1;}
        if (value < 1 || value > 99){
          alert(error);
          value = 1;}
        $('#value_text_field').val(value);
    });



    $("#click_minus").on("click",function() {
        decrement()
    });

    $("#click_plus").on("click",function() {
        increment()
    });


    function decrement() {
        $('#value_text_field').val( function(i, oldval) {
            if(parseInt(oldval) > 1){
                return --oldval;
            }
            else{
                oldval = 1;
                return oldval;
            }
        });
    }

    function increment() {
        $('#value_text_field').val( function(i, oldval) {
            if(parseInt(oldval) < 99){
                return ++oldval;
            }
            else{
                oldval = 99;
                return oldval;
            }
        });
    }


    $('#star-rating').raty({
        path: '/assets',
        scoreName: 'review[rating]'
     });
    
    // Configure/customize these variables.
    var showChar = 280;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = "Read More";
    var lesstext = "Show less";
    

    $('.more').each(function() {
        var content = $(this).html();
        if(content.length > showChar) {
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
 
    });
 
    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });
});