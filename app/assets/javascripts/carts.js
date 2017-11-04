document.addEventListener("turbolinks:load", function() {
    

    $(".clickminus").on("click",function() {
            decrement($(this).next())
        });

        $(".clickplus").on("click",function() {
            increment($(this).prev())
        });


        function decrement(attr) {
            $(attr).val( function(i, oldval) {
                if(parseInt(oldval) > 1){
                    return --oldval;
                }
                else{
                    oldval = 1;
                    return oldval;
                }
            });
        }

        function increment(attr) {
            $(attr).val( function(i, oldval) {
                if(parseInt(oldval) < 99){
                    return ++oldval;
                }
                else{
                    oldval = 99;
                    return oldval;
                }
            });
        }


});