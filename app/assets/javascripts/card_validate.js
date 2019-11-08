$(document).on('turbolinks:load', function() {
  $("#add-card").validate(
    {
      rules: {
          number : {
              required: true
          }
      },
      messages: {
          number: {
              required: "必須項目です。"
          }
      },
      errorPlacement: function(error, element) {
        //指定タグの中に出したい場合はappendTo()
        error.appendTo($('#message'));
      }
  }
  );
});