$(document).on('turbolinks:load', function() {

  jQuery.validator.addMethod("pass", function(value, element) {
    return this.optional(element) || /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}$/i.test(value);
    }, ""
  );

  jQuery.validator.addMethod("kana", function(value, element) {
    return this.optional(element) || /^([ァ-ン]|ー)+$/.test(value);
    }, ""
  );

  jQuery.validator.addMethod("hirakan", function(value, element) {
    return this.optional(element) || /^[一-龥ぁ-ん]/.test(value);
    }, ""
  );

  $("#new_user").validate({
      rules: {
        "user[nickname]": {
          required: true,
          maxlength: 20
        },
        "user[email]": {
          required: true,
          email: true
        },
        "user[password]": {
          required: true,
          rangelength: [7,128],
          pass: true
        },
        "user[password_confirmation]": {
          equalTo: "#user_password"
        },
        "user[last_name]": {
          required: true,
          maxlength: 35,
          hirakan: true
        },
        "user[first_name]": {
          required: true,
          maxlength: 35,
          hirakan: true
        },
        "user[last_name_kana]": {
          required: true,
          maxlength: 35,
          kana: true
        },
        "user[first_name_kana]": {
          required: true,
          maxlength: 35,
          kana: true
        },
        "user[birth_year_id]": {
          required: true
        },
        "user[birth_month]": {
          required: true
        },
        "user[birth_day]": {
          required: true
        },
      },
      messages: {
      "user[nickname]": {
        required: "ニックネームを入力してください。",
        maxlength: "20文字以下で入力してください。"
      },
      "user[email]": {
        required: "メールアドレスを入力してください",
        email: "フォーマットが不適切です"
      },
      "user[password]": {
        required: "パスワードを入力してください",
        rangelength: "パスワードは7文字以上128文字以下で入力してください",
        pass: "英字と数字両方を含むパスワードを設定してください"
      },
      "user[password_confirmation]": {
        equalTo: "パスワードが一致しません"
      },
      "user[last_name]": {
        required: "姓を入力してください",
        maxlength: "姓は35文字までです",
        hirakan: "姓に数字や特殊文字は使用できません"
      },
      "user[first_name]": {
        required: "名を入力してください",
        maxlength: "名は35文字までです",
        hirakan: "名に数字や特殊文字は使用できません"
      },
      "user[last_name_kana]": {
        required: "姓カナを入力してください",
        maxlength: "姓カナは35文字までです",
        kana: "姓カナに数字や特殊文字は使用できません"
      },
      "user[first_name_kana]": {
        required: "名カナを入力してください",
        maxlength: "名カナは35文字までです",
        kana: "名カナに数字や特殊文字は使用できません"
      },
      "user[birth_year_id]": {
        required: "生年月日を入力してください"
      },
      "user[birth_month]": {
        required: ""
      },
      "user[birth_day]": {
        required: ""
      },

    },

    errorPlacement: function(error, element) {
      switch(element.attr('name')) {
        case "user[last_name]":
          error.insertAfter($('#field1_error'));
          break;
        case "user[first_name]":
          error.insertAfter($('#field2_error'));
          break;
        case "user[last_name_kana]":
          error.insertAfter($('#field3_error'));
          break;
        case "user[first_name_kana]":
          error.insertAfter($('#field4_error'));
          break;
        case "user[birth_year_id]":
          error.insertAfter($('#field5_error'));
          break;
        default:
          error.insertAfter(element);
      }
    }
  });
});
