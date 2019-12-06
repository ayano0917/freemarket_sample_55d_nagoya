// $(function() {
//   var savedImg = $('.saved-img').length;
//   var previewCount = $('.img').length; //previewの数によってdropboxのwidthを変更
//   var imgCount = previewCount + savedImg

// // 初回読み込み時のアップロードBOX操作
//   $(window).on('load', function() {
//     if (imgCount == 0 || imgCount == 5){
//       $('.form-mask-image').width(618);
//     } else if (imgCount == 1 || imgCount == 6){
//       $('.form-mask-image').width(490);
//     } else if (imgCount == 2 || imgCount == 7){
//       $('.form-mask-image').width(360);
//     } else if (imgCount == 3 || imgCount == 8){
//       $('.form-mask-image').width(230);
//     } else if (imgCount == 4 || imgCount == 9){
//       $('.form-mask-image').width(100);
//     }
//   });
  
// // 画像をアップした際のプレビューについて
//   $('.form-mask-image:first').removeClass('label-hide')
//     $(document).on('change', 'input[type="file"]', function(event){
//       var previewCount = previewCount + 1 
//       $preview_new = $(this).parent();
//       previewfile(event,$preview_new)
//       $(this).parent().parent().parent().addClass("label-hide");
//       $(this).parent().parent().parent().next().next('.form-mask-image').removeClass("label-hide");
//       // $(this).parent().parent().parent().next('.form-mask-image').removeClass("label-hide");

//     })
//     function previewfile(e,$preview_new) {
//       var file = e.target.files[0],
//         reader = new FileReader();
//       if(file.type.indexOf("image") < 0){ //image以外はfalse
//         return false;
//       }

//       reader.onload = (function(file) {
//         return function(e){
//           var buildPreviewHTML =`<div class='upload-item' style='display:inline-block'>
//                                   <div class='upload-item__square'>
//                                     <img class='img'>
//                                   </div>
//                                   <div class='upload-item__btn-box'>
//                                     <span class='upload-item__btn-box--edit'>編集</span>
//                                     <span class='upload-item__btn-box--delete'>削除</span>
//                                   </div>
//                                 </div>`;
//           $preview_new.parent().parent().after(buildPreviewHTML)
//           $preview_new.parent().parent().next().children().children('img').attr({src: e.target.result})

//           // プレビュー画像の削除ボタンを押した際の動作
//           $('.upload-item__btn-box--delete').on('click',function(){
//             $(this).parent().parent().remove();
//           });
//         };
//       })(file);
//     reader.readAsDataURL(file);
//   }
//   // 保存済み画像の削除ボタンを押した際の動作
//   $('.saved-upload-item__btn-box--delete').on('click',function(){
//     $(this).parent().parent().remove();
//     $(this).next().val('true');
//   });

//   // $(document).on('change', 'input[type="file"]', function(){
//   $('input[type="file"]').change (function(){
//       // $(($('.img').length) && ($('.saved-img').length)).change (function() {
//     console.log("aaa")
//     console.log(savedImg)
//     console.log((".saved-img").length)
//     console.log(previewCount)
//     console.log((".img").length)

//     var editImageCount = previewCount + 1
//     //previewの数によってdropboxのwidthを変更
//     var deleteCount = editImageCount + savedImg
//     console.log(deleteCount)
//     if (deleteCount == 0 || deleteCount == 5){
//       $('.form-mask-image').width(618);
//     } else if (deleteCount == 1 || deleteCount == 6){
//       $('.form-mask-image').width(490);
//     } else if (deleteCount == 2 || deleteCount == 7){
//       $('.form-mask-image').width(360);
//     } else if (deleteCount == 3 || deleteCount == 8){
//       $('.form-mask-image').width(230);
//     } else if (deleteCount == 4 || deleteCount == 9){
//       $('.form-mask-image').width(100);
//     }
//   })
// });

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
          var imgCount = previewCount + savedImg
          if  (imgCount == 1 || imgCount == 6){
            $('.form-mask-image').width(480);
          } else if (imgCount == 2 || imgCount == 7){
            $('.form-mask-image').width(360);
          } else if (imgCount == 3 || imgCount == 8){
            $('.form-mask-image').width(230);
          } else if (imgCount == 4 || imgCount == 9){
            $('.form-mask-image').width(100);
          } else if (imgCount == 5){
            $('.form-mask-image').width(620);
          } else if (imgCount == 10){
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
            var previewCountD = $('.img').length; //previewの数によってdropboxのwidthを変更
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
          });
        };
      })(file);
    reader.readAsDataURL(file);
  }
});
