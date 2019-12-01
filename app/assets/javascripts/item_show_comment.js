$(function() {
  $("#t-area").keyup(function() {
    var text = $(this).val();
  if (text.length >= 1) {
  $("#s-btn").css("background-color","red");
  $("#s-btn").css("border-color", "red");
  }
  else {
  $("#s-btn").css("background-color","");
  $("#s-btn").css("border-color", "");
  }
  });
});