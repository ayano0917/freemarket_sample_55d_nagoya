$(function() {
  var savedImg = $('.saved-img').length;
    console.log(savedImg)
  var previewCount = $('.img').length; //previewの数によってdropboxのwidthを変更
    console.log(previewCount)
  var ImgCount = previewCount + savedImg

// 初回読み込み時のアップロードBOX操作
  $(window).on('load', function() {
    if (ImgCount == 0 || ImgCount == 5){
      $('.form-mask-image').width(618);
    } else if (ImgCount == 1 || ImgCount == 6){
      $('.form-mask-image').width(490);
    } else if (ImgCount == 2 || ImgCount == 7){
      $('.form-mask-image').width(360);
    } else if (ImgCount == 3 || ImgCount == 8){
      $('.form-mask-image').width(230);
    } else if (ImgCount == 4 || ImgCount == 9){
      $('.form-mask-image').width(100);
    }
  });
  
// 画像をアップした際のプレビューについて
  $('.form-mask-image:first').removeClass('label-hide')
    $(document).on('change', 'input[type="file"]', function(event){
      var previewCount = previewCount + 1 
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
          
          // プレビュー画像の削除ボタンを押した際の動作
          $('.upload-item__btn-box--delete').on('click',function(){
            $(this).parent().parent().remove();
          });
        };
      })(file);
    reader.readAsDataURL(file);
  }
  // 保存済み画像の削除ボタンを押した際の動作
  $('.saved-upload-item__btn-box--delete').on('click',function(){
    $(this).parent().parent().remove();
  });

  // $(document).on('change', 'input[type="file"]', function(){
  $('input[type="file"]').change (function(){
      // $(($('.img').length) && ($('.saved-img').length)).change (function() {
    console.log("aaa")
    console.log($('.saved-img').length)
    console.log($('.img').length)

    var savedImgChange = $('.saved-img').length;
    console.log(savedImgChange)
    var previewCountD = $('.img').length; //previewの数によってdropboxのwidthを変更
    console.log(previewCountD)
    var deleteCount = previewCountD + savedImg
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
  })
});
