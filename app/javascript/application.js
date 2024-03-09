

import "@hotwired/turbo-rails"
import "controllers"


$(document).on("turbo:load", () => {
    console.log("turbo")
});

$(document).on("turbo:load", function () {
    $(".dropdown-trigger").dropdown();
    $('.sidenav').sidenav();
    $('#fade-out-target').fadeOut(4000)
});



// document.addEventListener('turbo:load', function () {
//     document.querySelector(".dropdown-trigger").dropdown();
// });
