$(document).on('turbolinks:load', function() { //出品ページに遷移後リロード
  $(function(){
    function modalWindow(){
      var modalHtml = `<div class="item-create">
                        <div class="item-create__box">
                          <div class="item-create__box__head">
                            <h1 class="complete">出品が完了しました。</h1>
                          </div>
                          <div class="item-create__box__message">
                            あなたが出品した商品は「出品した商品一覧」からいつでも見ることができます。
                          </div>
                          <a class="item-create__box__btn" data-turbolinks="false" href="/items/new">続けて出品する</a>
                          <p class="item-create__box__share">
                          <a href="/">トップページへ戻る</a>
                          </p>
                        </div>
                      </div>`
        return modalHtml
          }



    $('#new_item').on('submit', function(eve){
      eve.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(){
        var modal = modalWindow;
        $(function(){
          $(".display-main").append(modal);
            $(".item-create,.item-create__box").fadeIn();
          });
          locateCenter();  // => モーダルウィンドウを中央配置するための初期値を設定する
          $(window).resize(locateCenter);  // => ウィンドウのリサイズに合わせて、モーダルウィンドウの配置を変える
        
          // モーダルウィンドウを中央配置するための配置場所を計算する関数
          function locateCenter() {
            let w = $(window).width();
            let h = $(window).height();
            
            let cw = $(".item-create__box").outerWidth();
            let ch = $(".item-create__box").outerHeight();
            
            $(".item-create__box").css({
              'left': ((w - cw) / 2) + 'px',
              'top': ((h - ch) / 3.5) + 'px'
            });
          }
        })
      .fail(function(){
        
      })
    })
  })
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
            $preview_new.parent().parent().after(buildPreviewHTML)
            $preview_new.parent().parent().next().children().children('img').attr({src: e.target.result})

            var previewCount = $('.img').length; //previewの数によってdropboxのwidthを変更
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
            var delete_btn = $('.upload-item__btn-box--delete').on('click',function(){
              var c = $(this).parent().parent().prev().children().children().children("").clone();//fileクローンをcに代入
              c.val('');
              $(this).parent().parent().prev().children().children().children("").replaceWith(c);//１つ前のfileにクローンを置き換える
              c.remove() //クローンを削除
              $(this).parent().parent().prev().appendTo('.upload-box__dropbox');
              $(this).parent().parent().remove();
              $(".upload-item:last").next(".form-mask-image").removeClass("label-hide'");//完全に消えたdropboxを復活させる
              var deleteCount = $('.img').length; //previewの数によってdropboxのwidthを変更
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