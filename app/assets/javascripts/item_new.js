$(document).on('turbolinks:load', function() { //出品ページに遷移後リロード

// $(function(){
//   var saved_image_num = $('.upload-container').data('num');
//   var image_count = saved_image_num;

// // プレビューBOXの生成
//   function buildPreviewHTML(e, image_count) {
//     var html =`<ul>
//                   <li class='upload-item'>
//                     <div class='upload-item__square'>
//                       <img src='${e.target.result}' class='image-preview' data-image=${image_count}>
//                     </div>
//                     <div class='upload-item__btn-box'>
//                       <span class='upload-item__btn-box--edit'>編集</span>
//                       <span class='upload-item__btn-box--delete' data-image=${image_count}>削除</span>
//                     </div>
//                   </li>
//                 </ul>`;
//     return html;
//   }

//   // アップロードBOXの生成
//   // function buildInputImageBox(image_count){
//   //   var html = `<div class='upload-container__file-box' id='have-item-${$('.upload-container__items').length}' data-image=${image_count}>
//   //                 <input class='upload-container__file${image_count}' type="hidden">
//   //                 <pre class='upload-container--sentence'>
//   //                   クリックしてファイルをアップロード
//   //                 </pre>
//   //               </div>`
//   //   return html
//   // }

//   // 画像のプレビュー表示
//   function readURL(input) {
//     if (input.files && input.files[0]) {
//       var reader = new FileReader();
//       reader.onload = function (e) {

//         var insertHTML = buildPreviewHTML(e, image_count);
//         if (($('.upload-images').children().length) < 5) {
//           console.log(2)
//           $('.upload-images').append(insertHTML);
//         } else {
//           console.log
//           $('.upload-box__dropbox').removeClass('hide');
//           $('.upload').append(insertHTML);
//         }
//         $('.label-hide').attr(buildPreviewHTML)
//         // $('.upload-container__file-box').append(`<input class ='upload-container__file''name ='item[images_attributes][${image_count}][image]' type ='file'>`)
//         // $('.upload-container__file-box').append(`<input class ='upload-container__file''name ='image[][name]' type ='file'>`)

//         // image_count += 1;
//       }
//       console.log(3)
//       reader.readAsDataURL(input.files[0]);
//       // 親要素取得しhide、appendする→新アップロードBOX作成
//       $(input).parent().addClass('hide');
//       // $('.upload-images').append(buildInputImageBox(image_count+input.files.length));

//       if ($('#item-container2').children().length == 4) {
//         $('.upload-container__file-box').last().addClass('hide');
//       }
//     }
//   }

//   // $('.image-label').on("change", function(){
//   //   console.log(20)
//   //   var formData = new FormData($(".new_item")[0])
//   //   // debugger
//   //   for(item of formData){
//   //   console.log(item);
//   //   }
//   // })

// //   $(function() {
// //     $('.image-label').on('change', function() {
// //         var fileReader = new FileReader();

// //         fileReader.onload = function(event) {
// //             var loadedImageUri = event.target.result;
// //             $('body').append('<img src=' + loadedImageUri + '>');
// //         };

// //         fileReader.readAsDataURL(this.files[0]);
// //     });
// // });



  // プレビュー表示を読み込む★
  // $(document).on('change', '.upload-container__file', function(){
  //   readURL(this);
  //   if (image_count == 0 || image_count ==5){
  //     $('.upload-container').width(490);
  //   } else if (image_count == 1 || image_count ==6){
  //     $('.upload-container').width(360);
  //   } else if (image_count == 2 || image_count ==7){
  //     $('.upload-container').width(230);
  //   } else if (image_count == 3 || image_count ==8){
  //     $('.upload-container').width(130);
  //   } else if (image_count == 4){
  //     $('.upload-container').width(0);
  //   } else if (image_count == 9){
  //     $('.upload-container').width(0);
  //   }
  // });

//   // // アップロードBOXの削除(have-item-?)と連動
//   // $(document).on('click','.upload-item__btn-box--delete', function(){
//   //   var delete_box = $(this).parent().parent();
//   //   var uploaded_num = $(this).attr('data-image');
//   // // parent先のアップロードBoxの削除
//   //   delete_box.remove();
//   //   // 削除画像が元画像か今回追加画像か
//   //   if (uploaded_num <= saved_image_num) {
//   //     // 元画像→配列要素0
//   //     $('saved-image-'+ uploaded_num).val(0);
//   //   } else {
//   //     // 追加画像の場合
//   //     $('upload-container__file-box').each(function(index, element){
//   //       if ($(element).data('image')==uploaded_num) {
//   //         $(element).remove();
//   //       }
//   //     });
//   //   }
//     // アップロードBOXのサイズ変更のため、クラス名の追加&削除
//     $('.upload-container__file-box').last().removeClass(function(index, className){
//       return (className.match(/\bhave-item-\S+/g) || []).join(' ');
//     });
//   })
// // })

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
