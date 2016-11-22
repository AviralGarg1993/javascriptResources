/* JavaScript code to add to cjs chrome extension for better coding 
 * environment in HackerRank
 */
$(document).keydown(function (e) {
    //console.log(e.keyCode);
    if (e.keyCode == 20) {
        $('button:contains(Run Code)').trigger("click");
        console.log($('.error-output').html());
    }
});
document.addEventListener("DOMNodeInserted", function (event) {
    $(document).html('<div class="thisone">' + $("code").html() +
        '</div>');
    console.log(
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    );
    console.log($('.error-output').html());
    $(document).scrollTop('813');
});
