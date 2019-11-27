$(document).on('turbolinks:load', function() {
  $("#user_sign_in").validate({
    rules: {
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        rangelength: [7,128]
      },
    },
    messages: {
      "user[email]": {
        required: "メールアドレスを入力してください",
        email: "フォーマットが不適切です"
      },
      "user[password]": {
        required: "パスワードを入力してください",
        rangelength: "パスワードは7文字以上128文字以下で入力してください"
      },
    }
  });
});
