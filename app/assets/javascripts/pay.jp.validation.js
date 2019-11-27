$(document).on('turbolinks:load', function() {
  jQuery.validator.addMethod("hansuuzi", function(value, element) {
    return this.optional(element) || /^[0-9]+$/.test(value);
    }, ""
  );

  jQuery.validator.addMethod("kana", function(value, element) {
    return this.optional(element) || /^([ァ-ン]|ー)+$/.test(value);
    }, ""
  );

    $("#add-card").validate({
    rules: {
      "number": {
        hansuuzi: true,
        required: true
      },
      "cvc": {
        required: true,
      },
    },
    messages: {
      "number": {
        hansuuzi: "半角数字で入力してください",
        required: "必須項目です"
      },
      "cvc": {
        required: "必須項目です",
      },
    }
  });
});