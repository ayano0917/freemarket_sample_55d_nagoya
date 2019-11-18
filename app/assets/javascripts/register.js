$(document).on('turbolinks:load', function() {
  $("#user_form").validate({
      rules: {
        "user[nickname]": {
          required: true,
          maxlength: 20
        },
        "user[email]": {
          required: true,
        },
        "user[password]": {
          required: true,
          rangelength: [7,128]
        },
        "user[password_confirmation]": {
          required: true
        },
        "user[last_name]": {
          required: true
        },
        "user[first_name]": {
          required: true
        },
        "user[last_name_kana]": {
          required: true
        },
        "user[first_name_kana]": {
          required: true
        },
      },
      messages: {
      "user[nickname]": {
        required: "ニックネームを入力してください。",
        maxlength: "20文字以下で入力してください。"
      },
      "user[email]": {
        required: "メールアドレスを入力してください"
      },
      "user[password]": {
        required: "パスワードを入力してください",
        rangelength: "パスワードは7文字以上128文字以下で入力してください"
      },
      "user[password_confirmation]": {
        required: "パスワードを入力してください"
      },
      "user[last_name]": {
        required: "メールアドレスを入力してください"
      },
      "user[first_name]": {
        required: "メールアドレスを入力してください"
      },
      "user[last_name_kana]": {
        required: "メールアドレスを入力してください"
      },
      "user[first_name_kana]": {
        required: "メールアドレスを入力してください"
      },

    }
  });
});
