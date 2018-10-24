$(".menuDown").on('click', function () {
    $('.menuDown').removeClass('active');
    $(this).addClass('active');
    var togText = $(this).parent().next();
    $('.dropDown').slideUp('slow');
    togText.slideDown('slow');
});