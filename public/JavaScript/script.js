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

    $(".lightbox-trigger, .lightbox-trigger-top").click(function() {
        var $image_src = $(this).attr("src");
        $(".lightbox-image").attr("src", $image_src);
        $("#lightbox").css("visibility", "visible");
        $(".lightbox-image, #lightbox").click(function() {
            $("#lightbox").css("visibility", "hidden");
        });
    });

});