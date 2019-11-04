$(function() {
  $('#card_image').on({
    'mouseenter': function() {
      let html = `
    <div class="main-container__chapter__content__security-code__card-image", id="add" >
      カードの裏面をご参照ください。
      <br>
      <img src="//www-mercari-jp.akamaized.net/assets/img/signup/seq-card.png?465897195" alt="" width="240">
    </div>
    `;
    $('#card_image').append(html);
    },
    'mouseleave': function() {
      $('.main-container__chapter__content__security-code__card-image').remove();
    }
  })
});

