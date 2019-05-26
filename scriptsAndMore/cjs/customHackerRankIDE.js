// Here You can type your custom JavaScript...
var errorMessage = ' ';
jQuery.fx.off = true;
$(document).keydown(function (e) {
    if (e.keyCode == 20) $('button:contains(Run Code)').trigger("click");
});
window.setInterval(function () {
    //if ($(this).scrollTop() > 900) $(this).scrollTop('800');
    if ($('.error-output').text() !== errorMessage) {
        errorMessage = $('.error-output').text();
        if (errorMessage !== ''){
            placeDiv(500, 800);
            console.log($('#output'));
        }
    }
    
    
}, 100);

function placeDiv(x_pos, y_pos) {
  var d = document.getElementsByClassName('challenge-response container fs-container')[0];
  console.log(d);
  d.id = 'output';
  d.style.position = "absolute";
  d.style.left = x_pos+'px';
  d.style.top = y_pos+'px';
}
