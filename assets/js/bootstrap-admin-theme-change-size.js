var base_url = $('#base_url').val();
$(function() {
    var sizeChangerContainer = '.bootstrap-admin-theme-change-size';

    $('.size-changer', sizeChangerContainer).on('click', function() {

        var setLargeSize = $(this).hasClass('large');

        if (setLargeSize && $('link[href^="'+base_url+'assets/css/bootstrap-admin-theme"]').length === 2) {
            return false;
        }

        $(this).addClass('active');

        if (setLargeSize) {
            $('link[href="'+base_url+'assets/css/bootstrap-admin-theme-small.css"]').remove();
            $('link[href="'+base_url+'assets/css/bootstrap-small.css"]').remove();

            $('.small', sizeChangerContainer).removeClass('active');
            return true;
        }

        $('head').append('<link rel="stylesheet" media="screen" href="'+base_url+'assets/css/bootstrap-small.css"><link rel="stylesheet" media="screen" href="'+base_url+'assets/css/bootstrap-admin-theme-small.css">');
        $('.large', sizeChangerContainer).removeClass('active');
    });
});