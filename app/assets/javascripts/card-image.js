$(document).on('turbolinks:load', function() {
  $('#card-image').on({
    click: function() {
      $("#add-card").validate(
      let p = $('div').hasClass('main-container__chapter__content__security-code__card-image');
      if(p) {
        $('#add').remove();
      } else {
        let html = `
          <div class="main-container__chapter__content__security-code__card-image", id="add" >
            カードの裏面をご参照ください。
            <br>
            <img src="//www-mercari-jp.akamaized.net/assets/img/signup/seq-card.png?465897195" alt="" width="240">
          </div>
          `;
        $('#card-image').append(html);
      }
    }
  })
});

