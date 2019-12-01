$(window).on('load', function () {
  $(function() {
    let focus1 = $('.wrapper__sidebar__nav__list__1__link');
    let focus2 = $('.wrapper__sidebar__nav__list2__1__link');
    let focus3 = $('.wrapper__sidebar__nav__list3__1__link');
    let icon1 = $('.wrapper__sidebar__nav__list__1__link__icon');

    focus1.add(focus2).add(focus3).hover(function() {
      $(this).css('background-color', '#FAFAFA');
      $(this).children(icon1).css("color", "#333");
      $(this).children(icon1).animate({
        top: "11px",
        right: "12px",
      }, 200);
    },(function() {
      $(this).css('background-color', '#FFFFFF');
      $(this).children(icon1).css("color", "#ccc");
      $(this).children(icon1).animate({
        top: "11px",
        right: "16px",
      }, 200);
    })
    )
  });
})