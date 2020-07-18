/*!
 * easion - Bootstrap dashboard template based on Bootstrap 4
 * Version v1.0.1
 * Copyright 2016 - 2020 Mudimedia Software
 * https://mudimedia.com
 */

$(document).ready(function(){
    $(".dash-nav-dropdown-toggle").click(function(){
        $(this).closest(".dash-nav-dropdown")
            .toggleClass("show")
            .find(".dash-nav-dropdown")
            .removeClass("show");

        $(this).parent()
            .siblings()
            .removeClass("show");
    });
});
