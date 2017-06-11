$("document").ready(function() {

    $(".menu_item, .active").mouseenter(function() {
        var $originalString = $(this).html();
        $(this).html(">" + $originalString);
        $(this).prev($("span")).hide();
        $(this).mouseleave(function() {
            $(this).html($originalString);
            $(this).prev($("span")).show();
        });
    });

    $(".icon").mouseenter(function() {
        $(this).css("opacity", "0.4");
        $(this).mouseleave(function() {
           $(this).css("opacity", "1.0")
        });
    });

    $('#okay').click(function() {
        $.post('/contact/delete');
        $('#confirmation_lightbox').css('visibility', 'hidden');
    });

    $(".lightbox-trigger, .lightbox-trigger-top").click(function() {
        var image_src = $(this).attr("src");
        $("#gallery_body").css("overflow", "hidden");
        $(".lightbox-image").attr("src", image_src);
        $(".lightbox").css("visibility", "visible");
        $(".close_lightbox").click(function() {
            $(".lightbox").css("visibility", "hidden");
            $("#gallery_body").css("overflow", "visible");
        });
    });

});
