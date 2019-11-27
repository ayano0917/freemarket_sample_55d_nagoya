// $(document).on('turbolinks:load', function() { //出品ページに遷移後リロード
  
//   var secondHtml = `<div class="sell-upload-items second">
//                     <ul class="pictures"></ul>
//                   </div>`
//   i = 0;

//   $(document).on('change', 'input[type="file"]', function(e){
//     $preview = $(this);
//     previewFile(e,$preview);
//   });
//   function previewFile(e,$preview){
//     var file = e.target.files[0];
//     var reader = new FileReader();
//     if(file.type.indexOf("image") < 0){   //image以外はfalse
//       return false;
//     }

//     reader.onload = (function(file) {
//       return function(e){
//         var htmlWhole = `<div class="saved-upload-item"  style='display:inline-block'>
//                           <div class="saved-upload-item__square">
//                             <img class="saved-img" src="${e.target.result}" >
//                           </div>
//                           <div class="saved-upload-item__btn-box">
//                             <div class='saved-upload-item__btn-box--edit'>編集</div>
//                             <div class='saved-upload-item__btn-box--delete'>削除</div>
//                           </div>
//                         </div>`
//         var preView = $('.saved-img').length;
//         if(preView <= 4){
//           $('.pictures').append(htmlWhole);
//         }else if (preView == 5) {
//           $('.sell-upload-items').after(secondHtml);
//           $('.second .pictures').append(htmlWhole);
//         }else if (preView > 5){
//           $('.second .pictures').append(htmlWhole);
//         }

//         var previewCount = $('.img').length;

//         var currentId = document.getElementById("item_images_attributes_"+ num +"_image");
//         $(currentId).parent().parent.next().show();
//         $(currentId).parent().parent.hide();

//         num +=1;


//         if (previewCount == 1 || previewCount == 6){
//           $('.sell-upload-drop-box').width(491);
//         } else if (previewCount == 2 || previewCount == 7){
//           $('.sell-upload-drop-box').width(363);
//         } else if (previewCount == 3 || previewCount == 8){
//           $('.sell-upload-drop-box').width(234);
//         } else if (previewCount == 4 || previewCount == 9){
//           $('.sell-upload-drop-box').width(106);
//         } else if (previewCount == 5){
//           $('.sell-upload-drop-box').width(620);
//         } else if (previewCount == 10){
//           $('.sell-upload-drop-box').css('display','none');
//         }

//         $("#sell-upload-delete" + i).click(function(){
//           var c = $(this).parent().parent().prev().children().children()
//           c.val('');
//           $(this).parent().parent().prev().children().children().replaceWith(c);
//           $(this).parent().parent().prev().hide();
//           $(this).parent().parent().prev().appendTo('.sell-dropbox-container');
//           c.remove();
//         });
//         i += 1;
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   }
// });

