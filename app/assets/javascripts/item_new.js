$(function(){
  var saved_image_num = $('.upload-container').data('num');
  var image_count = saved_image_num;

// プレビューBOXの生成
  function buildPreviewHTML(e, image_count) {
    var html =`<div class='upload-images'>
                <ul>
                  <li class='upload-item'>
                    <div class='upload-item__square'>
                      <img src='${e.target.result}' class='image-preview' data-image=${image_count}>
                    </div>
                    <div class='upload-item__btn-box'>
                      <span class='upload-item__btn-box--edit'>編集</span>
                      <span class='upload-item__btn-box--delete' data-image=${image_count}>削除</span>
                    </div>
                  </li>
                </ul>
              </div>`;
    return html;
  }

  // アップロードBOXの生成
  // function buildInputImageBox(image_count){
  //   var html = `<div class='upload-container__file-box' id='have-item-${$('.upload-container__items').length}' data-image=${image_count}>
  //                 <input class='upload-container__file${image_count}' type="hidden">
  //                 <pre class='upload-container--sentence'>
  //                   クリックしてファイルをアップロード
  //                 </pre>
  //               </div>`
  //   return html
  // }

  // 画像のプレビュー表示
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        var insertHTML = buildPreviewHTML(e, image_count);
        if (($('#item-preview1').children().length) < 4) {
          $('#item-preview1').append(insertHTML);
        } else {
          $('#item-container2').removeClass('hide');
          $('#item-container2').append(insertHTML);
        }
        image_count += 1;
      }
      reader.readAsDataURL(input.files[0]);
      // 親要素取得しhide、appendする→新アップロードBOX作成
      $(input).parent().addClass('hide');
      // $('.upload-images').append(buildInputImageBox(image_count+input.files.length));

      if ($('#item-container2').children().length == 4) {
        $('.upload-container__file-box').last().addClass('hide');
      }
    }
  }


  // プレビュー表示を読み込む★
  $(document).on('change', '.upload-container__file', function(){
    readURL(this);
    if (image_count == 0 || image_count ==5){
      $('.upload-container').width(490);
    } else if (image_count == 1 || image_count ==6){
      $('.upload-container').width(360);
    } else if (image_count == 2 || image_count ==7){
      $('.upload-container').width(230);
    } else if (image_count == 3 || image_count ==8){
      $('.upload-container').width(100);
    } else if (image_count == 4){
      $('.upload-container').width(620);
    } else if (image_count == 9){
      $('.upload-container').width(0);
    }
  });

  // // アップロードBOXの削除(have-item-?)と連動
  // $(document).on('click','.upload-item__btn-box--delete', function(){
  //   var delete_box = $(this).parent().parent();
  //   var uploaded_num = $(this).attr('data-image');
  // // parent先のアップロードBoxの削除
  //   delete_box.remove();
  //   // 削除画像が元画像か今回追加画像か
  //   if (uploaded_num <= saved_image_num) {
  //     // 元画像→配列要素0
  //     $('saved-image-'+ uploaded_num).val(0);
  //   } else {
  //     // 追加画像の場合
  //     $('upload-container__file-box').each(function(index, element){
  //       if ($(element).data('image')==uploaded_num) {
  //         $(element).remove();
  //       }
  //     });
  //   }
    // アップロードBOXのサイズ変更のため、クラス名の追加&削除
    $('.upload-container__file-box').last().removeClass(function(index, className){
      return (className.match(/\bhave-item-\S+/g) || []).join(' ');
    });
  })
// })