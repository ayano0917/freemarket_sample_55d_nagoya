$(document).on('turbolinks:load', function() {
  $("#user_form").validate({
      rules: {
        "user[nickname]": {
          required: true,
          maxlength: 20
        }
      },
      messages: {
      "user[nickname]": {
        required: "お名前を入力してください。",
        maxlength: "お名前は20文字以内で入力してください。"
      },
    }
  });
});
