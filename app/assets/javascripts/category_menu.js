$(document).on('turbolinks:load', function() {
  $(function() {
    let category = $('.main-header__inner__nav__search__category__link');
    let header_category = $('.category__header');
    let header_category_lists = $('.category__header__list');

    let header_brand = $('.main-header__inner__nav__search__brand__link');
    let header_brand_inner = $('.brand__header')
    let header_brand_lists = $('.brand__header__list')

    let header_like = $('.main-header__inner__nav__menu__like__link');

    let header_notification = $('.main-header__inner__nav__menu__notification__link');

    let header_todo = $('.main-header__inner__nav__menu__todo__link');

    let header_mypage = $('.main-header__inner__nav__menu__mypage__link');

    category.hover(function() {
      $('.header1').css("color", "#0295EE");
      header_category.add(header_category_lists).removeAttr('hidden');
    },(function() {
      $('.header1').css("color", "#333333");
      header_category.add(header_category_lists).attr('hidden', '');
      })
    );

    header_brand.hover(function() {
      $('.header2').css("color", "#0295EE");
      header_brand_inner.add(header_brand_lists).removeAttr('hidden');
    },(function() {
      $('.header2').css("color", "#333333");
      header_brand_inner.add(header_brand_lists).attr('hidden', '');
      })
    );

    header_like.hover(function() {
      $('.header3, .main-header__inner__nav__menu__like__link__icon').css("color", "#0295EE");
    },(function() {
      $('.main-header__inner__nav__menu__like__link__icon').css("color", "#cccccc")
      $('.header3').css("color", "#3d3d3d");
      })
    );

    header_notification.hover(function() {
      $('.header4, .main-header__inner__nav__menu__notification__link__icon').css("color", "#0295EE");
    },(function() {
      $('.main-header__inner__nav__menu__notification__link__icon').css("color", "#cccccc")
      $('.header4').css("color", "#3d3d3d");
      })
    );

    header_todo.hover(function() {
      $('.header5, .main-header__inner__nav__menu__todo__link__icon').css("color", "#0295EE");
    },(function() {
      $('.main-header__inner__nav__menu__todo__link__icon').css("color", "#cccccc")
      $('.header5').css("color", "#3d3d3d");
      })
    );

    header_mypage.hover(function() {
      $('.header6').css("color", "#0295EE");
    },(function() {
      $('.header6').css("color", "#3d3d3d");
      })
    );
  });
});