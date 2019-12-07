$(function() {
  $("#t-area").keyup(function() {
    var text = $(this).val();
  if (text.length >= 1) {
  $("#s-btn").css("background-color","#EA342D");
  $("#s-btn").css("border-color", "#EA342D");
  }
  else {
  $("#s-btn").css("background-color","");
  $("#s-btn").css("border-color", "");
  }
  });
});