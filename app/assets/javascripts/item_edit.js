$(document).on('turbolinks:load', function() { //出品ページに遷移後リロード

  var path = location.pathname;
  if (path == "/items/", "/items/:id/edit"){
    console.log("qq")
    // $('.form-mask-image').empty();
    // 最初以外のform-mask-imageを非表示
    $('.form-mask-image:first').removeClass('label-hide')
      $(document).on('change', 'input[type="file"]', function(event){
        $preview_edit = $(this).parent();
        previewfile(event,$preview_edit)
        $(this).parent().parent().parent().addClass("label-hide");
        $(this).parent().parent().parent().next('.form-mask-image').removeClass("label-hide");
      })
      function previewfile(e,$preview_edit) {
        var file = e.target.files[0],
          reader = new FileReader();
        if(file.type.indexOf("image") < 0){ //image以外はfalse
          return false;
        }

        reader.onload = (function(file) {
          return function(e){
            var buildPreviewHTML =`<div class='saved-upload-item' style='display:inline-block'>
                                    <div class='saved-upload-item__square'>
                                      <img class='saved-img'>
                                    </div>
                                    <div class='saved-upload-item__btn-box'>
                                      <span class='saved-upload-item__btn-box--edit'>編集</span>
                                      <span class='saved-upload-item__btn-box--delete'>削除</span>
                                    </div>
                                  </div>`;
            $preview_edit.parent().parent().after(buildPreviewHTML)
            $preview_edit.parent().parent().next().children().children('img').attr({src: e.target.result})

            var previewCount = $('.saved-img').length; //previewの数によってdropboxのwidthを変更
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
            var delete_btn = $('.saved-upload-item__btn-box--delete').on('click',function(){
              var c = $(this).parent().parent().prev().children().children().children("").clone();//fileクローンをcに代入
              c.val('');
              $(this).parent().parent().prev().children().children().children("").replaceWith(c);//１つ前のfileにクローンを置き換える
              c.remove() //クローンを削除
              $(this).parent().parent().prev().appendTo('.sell-dropbox-container');
              $(this).parent().parent().remove();
              $(".saved-upload-item:last").next(".form-mask-image").removeClass("label-hide'");//完全に消えたdropboxを復活させる
              var deleteCount = $('.saved-img').length; //previewの数によってdropboxのwidthを変更
              if (deleteCount == 0 || deleteCount == 5){
                $('.form-mask-image').width(618);
              } else if (deleteCount == 1 || deleteCount == 6){
                $('.form-mask-image').width(490);
              } else if (deleteCount == 2 || deleteCount == 7){
                $('.form-mask-image').width(360);
              } else if (deleteCount == 3 || deleteCount == 8){
                $('.form-mask-image').width(230);
              } else if (deleteCount == 4 || deleteCount == 9){
                $('.form-mask-image').width(100);
              }
            });
            $('.replace').replaceWith(delete_btn); //replaceをdeleteボタンに置き換える
          };
        })(file);
      reader.readAsDataURL(file);
    }
  }
});