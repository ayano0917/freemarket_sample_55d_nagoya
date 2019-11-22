$(document).on('turbolinks:load', function() {
  $("img.sub-photo").on("mouseover", function() {
    var ImgSrc = $(this).attr("src");
    $("img#bigphoto").attr({src:ImgSrc});
    $("img#bigphoto").hide();
    $("img#bigphoto").fadeIn();
        return false;
    });
  });