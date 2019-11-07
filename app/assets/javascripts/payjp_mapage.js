$(document).on('turbolinks:load', function() {
  if (document.getElementById("token_submit_mypage") != null) {
    Payjp.setPublicKey("pk_test_7d119735ca4098f71f0738e5");
    let btn = document.getElementById("token_submit_mypage");
    btn.addEventListener("click", e => {
      e.preventDefault();
      let card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      };
      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          $("#card_token_mypage").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          document.inputForm.submit();
        } else {
          $('#card-error').remove();
          let message = response.error.code
          console.log(message);
          if (message === "invalid_number") {
            let error ='<p id="card-error">カード番号に誤りがあります。正しく入力してください。</p>'
            $(".main-container__chapter__content").prepend(error);
          } else if (message === "expired_card") {
            let error ='<p id="card-error">有効期限に誤りがあります。正しく入力してください。</p>'
            $(".main-container__chapter__content").prepend(error);
          } else if (message === "invalid_cvc") {
            let error ='<p id="card-error">セキュリティコードに誤りがあります。正しく入力してください。</p>'
            $(".main-container__chapter__content").prepend(error);
          }
        }
      });
    });
  }
});
