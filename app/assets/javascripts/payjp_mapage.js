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
          console.log(status);
          console.log(response.error);
          console.log(response.error.code);
          alert("カード情報が正しくありません。");
        }
      });
    });
  }
});
