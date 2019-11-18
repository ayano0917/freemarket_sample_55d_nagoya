$(document).ready(function() {
  $("#user_form").validate({
      rules: {
        "user[nickname]": {
          required: true,
          maxlength: 50
        }
      },
      messages: {
      "user[nickname]": {
        required: "お名前を入力してください。",
        maxlength: "お名前は50文字以内で入力してください。"
      },
    }
  });
});
