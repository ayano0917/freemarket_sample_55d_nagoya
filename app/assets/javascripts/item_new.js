$(function(){
  var saved_image_num = $('.upload-container').data('num');
  var image_count = saved_image_num + 1;

// プレビューBOXの生成
  function buildPreviewHTML(e, image_count) {
    var html =`<li class='upload-item'>
                <div class='upload-item__square'>
                  <img src='${e.target.result}' class='image-preview' data-image=${image_count}>
                </div>
                <div class='upload-item__btn-box'>
                  <span class='upload-item__btn-box--edit'>編集</span>
                  <span class='upload-item__btn-box--delete' data-image=${image_count}>削除</span>
                </div>
              </li>`;
    return html;
  }

  // アップロードBOXの生成
  function buildInputImageBox(image_count){
    var html = `<div class='upload-container__file-box.have-item-${$('.upload-item').length+1}' data-image=${image_count}>
                  <input class='upload-container__file${image_count}' type="file">
                  <pre class='upload-container--sentence'>
                    クリックしてファイルをアップロード
                  </pre>
                </div>`
    return html
  }

  // 画像のプレビュー表示
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      console.log(1)
      reader.onload = function (e) {
        var insertHTML = buildPreviewHTML(e, image_count);
        if (($('#item-container1').children().length) < 5) {
          $('#item-container1').append(insertHTML);
          console.log(2)
        } else {
          $('#item-container2').removeClass('hide');
          $('#item-container2').append(insertHTML);
        }
        image_count += 1;
      }
      reader.readAsDataURL(input.files[0]);  
      
      $(input).parent().addClass('hide');
      $('.upload-item').append(buildInputImageBox(image_count+input.files.length));
      if ($('#item-container2').children().length == 4) {
        $('.upload-container__file-box').last().addClass('hide');
      }
    }
  }

  $(document).on('change', '.upload-container__file', function(){
    readURL(this);
  });
})