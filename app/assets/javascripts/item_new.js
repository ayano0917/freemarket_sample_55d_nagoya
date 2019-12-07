$(function() {
  var savedImg = $(".saved-img").length
  if  (savedImg  == 1 || savedImg  == 6){
    $('.form-mask-image').width(480);
  } else if (savedImg == 2 || savedImg == 7){
    $('.form-mask-image').width(360);
  } else if (savedImg == 3 || savedImg == 8){
    $('.form-mask-image').width(230);
  } else if (savedImg == 4 || savedImg == 9){
    $('.form-mask-image').width(100);
  } else if (savedImg == 5){
    $('.form-mask-image').width(620);
  } else if (savedImg == 10){
    $('.form-mask-image').addClass('label-hide');
  }
  // 最初以外のform-mask-imageを非表示
  $('.form-mask-image:first').removeClass('label-hide')
    $(document).on('change', 'input[type="file"]', function(event){
      $preview_new = $(this).parent();
      previewfile(event,$preview_new)
      $(this).parent().parent().parent().addClass("label-hide");
      $(this).parent().parent().parent().next('.form-mask-image').removeClass("label-hide");
    })
    // 保存済み画像の削除
    $('.saved-upload-item__btn-box--delete').on('click',function(){
      $(this).parent().parent().remove();
      var preImage = ($(".saved-img").length) + ($(".img").length)
      if  (preImage  == 1 || preImage  == 6){
        $('.form-mask-image').width(480);
      } else if (preImage == 2 || preImage == 7){
        $('.form-mask-image').width(360);
      } else if (preImage == 3 || preImage == 8){
        $('.form-mask-image').width(230);
      } else if (preImage == 4 || preImage == 9){
        $('.form-mask-image').width(100);
      } else if (preImage == 5){
        $('.form-mask-image').width(620);
      } else if (preImage == 10){
        $('.form-mask-image').addClass('label-hide');
      }
    });


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
          $preview_new.parent().parent().after(buildPreviewHTML)
          $preview_new.parent().parent().next().children().children('img').attr({src: e.target.result})
          var previewCount = ($(".saved-img").length) + ($(".img").length)
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
          $('.upload-item__btn-box--delete').on('click',function(){
            var c = $(this).parent().parent().prev().children().children().children("").clone();//fileクローンをcに代入
            c.val('');
            $(this).parent().parent().prev().children().children().children("").replaceWith(c);//１つ前のfileにクローンを置き換える
            c.remove() //クローンを削除
            $(this).parent().parent().prev().appendTo('.upload-box__dropbox');
            $(this).parent().parent().remove();
            $(".upload-item:last").next(".form-mask-image").removeClass("label-hide'");//完全に消えたdropboxを復活させる
            var imageCount = ($(".saved-img").length) + ($(".img").length)
            if (imageCount == 0 || imageCount == 5){
              $('.form-mask-image').width(618);
            } else if (imageCount == 1 || imageCount == 6){
              $('.form-mask-image').width(490);
            } else if (imageCount == 2 || imageCount == 7){
              $('.form-mask-image').width(360);
            } else if (imageCount == 3 || imageCount == 8){
              $('.form-mask-image').width(230);
            } else if (imageCount == 4 || imageCount == 9){
              $('.form-mask-image').width(100);
            }
          });
        };
      })(file);
    reader.readAsDataURL(file);
  }
});
