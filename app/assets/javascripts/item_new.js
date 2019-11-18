$(document).on('turbolinks:load', function() { //出品ページに遷移後リロード

  var path = location.pathname;
  if (path == "/items/new"){
    // 最初以外のform-mask-imageを非表示
    $('.form-mask-image:first').removeClass('label-hide')
      $(document).on('change', 'input[type="file"]', function(event){
        $preview_new = $(this).parent();
        previewfile(event,$preview_new)
        $(this).parent().parent().parent().addClass("label-hide");
        $(this).parent().parent().parent().next('.form-mask-image').removeClass("label-hide");
      })
      function previewfile(e,$preview_new) {
        var file = e.target.files[0],
          reader = new FileReader();
        if(file.type.indexOf("image") < 0){ //image以外はfalse
          return false;
        }

        reader.onload = (function(file) {
          return function(e){
            var buildPreviewHTML =`<div class='upload-item' style='display:inline-block'>
                                    <div class='upload-item__square'>
                                      <img class='img'>
                                    </div>
                                    <div class='upload-item__btn-box'>
                                      <span class='upload-item__btn-box--edit'>編集</span>
                                      <span class='upload-item__btn-box--delete'>削除</span>
                                    </div>
                                  </div>`;
            // $('.upload-images').attr(buildPreviewHTML)
            $preview_new.parent().parent().after(buildPreviewHTML)
            $preview_new.parent().parent().next().children().children('img').attr({src: e.target.result})

            var previewCount = $('.img').length; //previewの数によってdropboxのwidthを変更
            console.log($('.img').length)
            if  (previewCount == 1 || previewCount == 6){
              $('.form-mask-image').width(480);
            } else if (previewCount == 2 || previewCount == 7){
              $('.form-mask-image').width(360);
            } else if (previewCount == 3 || previewCount == 8){
              $('.form-mask-image').width(230);
            } else if (previewCount == 4 || previewCount == 9){
              $('.form-mask-image').width(100);
            } else if (previewCount == 5){
              $('.form-mask-image').width(620);
            } else if (previewCount == 10){
              $('.form-mask-image').addClass('label-hide');
            }
          }
        })(file);
      reader.readAsDataURL(file);
    }
  }
})
