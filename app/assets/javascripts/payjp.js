document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublickey("pk_test_79ae2d2743199a76f3eb36aa");
      let btn = document.getElementById("token_submit");
      btn.addEventListener("click", e => {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };  //入力されたデータを取得します。
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_number").removeAttr()
          }
        })
      })
    }
  }

)