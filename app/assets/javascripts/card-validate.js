$(document).on('turbolinks:load', function() {
  $("#add-card123").validate(
    {
      rules: {
          cvc : {
              required: true
          }
      },
      messages: {
          cvc: {
              required: "必須項目で1す。"
          }
      }
    }
  );
});