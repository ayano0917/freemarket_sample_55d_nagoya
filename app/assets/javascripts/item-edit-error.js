$(function(){
  $(".item-sell-btn").on('click',function(e){
    if(($("img").length) == 2){ 
      e.preventDefault();
      alert("商品画像は必須です")
      return false;
    }
    $(".edit_item").validate({

      rules: {
        "item[name]": {
          required: true,
          maxlength: 40
        },
        "item[description]": {
          required: true,
          maxlength: 1000
        },
        "item[parent_id]": {
          required: true,
        },
        "item[child_id]": {
          required: true,
        },
        "item[condition_id]": {
          required: true,
        },
        "item[shipping_fee_id]": {
          required: true,
        },
        "item[shipping_form_id]": {
          required: true,
        },
        "item[prefecture_id]": {
          required: true,
        },
        "item[days_before_shipping_id]": {
          required: true,
        },
        "item[price]": {
          required: true,
          number : true 
        },
      },
      messages: {
        "item[name]": {
          required: "商品名を入力してください",
          maxlength: "40字以内で入力してください"
        },
        "item[description]": {
          required: "商品説明を入力してください",
          maxlength: "1000字以内で入力してください"
        },
        "item[parent_id]": {
          required: "カテゴリを選択してください",
        },
        "item[child_id]": {
          required: "カテゴリを選択してください",
        },
        "item[condition_id]": {
          required: "商品の状態を選択してください",
        },
        "item[shipping_fee_id]": {
          required: "配送料の負担について選択してください",
        },
        "item[shipping_form_id]": {
          required: "発送方法を選択してください",
        },
        "item[prefecture_id]": {
          required: "発送元地域を選択してください",
        },
        "item[days_before_shipping_id]": {
          required: "発送までの日数を選択してください",
        },
        "item[price]": {
          required: "価格を入力してください",
          number : "数字で入力してください"
        },
      }
    });
  });
});
