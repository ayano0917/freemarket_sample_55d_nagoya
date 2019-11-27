$(document).on('turbolinks:load', function() {
  jQuery.validator.addMethod("test", function(value, element) {
    return this.optional(element) || /^[0-9]+$/.test(value);
    }, "")  

  jQuery.validator.addMethod("SpaceOnlyNg",function (val, elem) {
    return this.optional(elem) || val.trim().length > 0;
    }, "必須入力です。");

  // 上記カスタムバリデーション

  $("#add-card").validate({
    rules: {
      "number": {
        test: /^[0-9]+$/,
        SpaceOnlyNg: true
      },
      "cvc": {
        required: true,
        SpaceOnlyNg: true
      },
    },
    messages: {
      "number": {
        test: "半角数字で入力してください",
        SpaceOnlyNg: "必須"
      },
      "cvc": {
        required: "必須項目です",
        SpaceOnlyNg: "コメントは必ず入力してください。"
      },
    }
  });
});
