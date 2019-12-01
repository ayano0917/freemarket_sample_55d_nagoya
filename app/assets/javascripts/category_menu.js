$(window).on('load', function () {
  $(function() {
    let category = $('.main-header__inner__nav__search__category');
    let header_category = $('.category__header');
    let header_category_lists = $('.category__header__list');
    let header_category_lists_1  = $('.category__header__list__1');

    let header_category_list_2 = $('.category__header__list2');
    let header_category_list_2_1 = $('.category__header__list2__1');


    let header_brand = $('.main-header__inner__nav__search__brand');
    let header_brand_inner = $('.brand__header')
    let header_brand_lists = $('.brand__header__list')

    let header_like = $('.main-header__inner__nav__menu__like__link');

    let header_notification = $('.main-header__inner__nav__menu__notification__link');

    let header_todo = $('.main-header__inner__nav__menu__todo__link');

    let header_mypage = $('.main-header__inner__nav__menu__mypage__link');

    // カテゴリー

    category.hover(function() {
      $('.header1').css("color", "#0295EE");
      header_category.add(header_category_lists).removeAttr('hidden');
    },(function() {
      $('.header1').css("color", "#333333");
      header_category.add(header_category_lists).attr('hidden', '');
      })
    );

    header_category_lists.hover(function() {
      $(this).css("background-color", "#EA352D");
      $(this).children(header_category_lists_1).css("color", "#FFFFFF");
        $(this).children(header_category_lists_1).hover(function() {
          header_category_list_2.add(header_category_list_2_1).removeAttr('hidden');
        },(function() {
          header_category_list_2.add(header_category_list_2_1).attr('hidden', '');
          })
        );
    },(function() {
      $(this).css("background-color", "#FFFFFF");
      $(this).children(header_category_lists_1).css("color", "#333333");
      })
    );

    // ブランド

    header_brand.hover(function() {
      $('.header2').css("color", "#0295EE");
      header_brand_inner.add(header_brand_lists).removeAttr('hidden');
    },(function() {
      $('.header2').css("color", "#333333");
      header_brand_inner.add(header_brand_lists).attr('hidden', '');
      })
    );

    header_brand_lists.hover(function() {
      $(this).css("background-color", "#EA352D");
      $(this).children(header_category_lists_1).css("color", "#FFFFFF");
    },(function() {
      $(this).css("background-color", "#FFFFFF");
      $(this).children(header_category_lists_1).css("color", "#333333");
      })
    );


    // いいね！一覧

    header_like.hover(function() {
      $('.header3, .main-header__inner__nav__menu__like__link__icon').css("color", "#0295EE");
    },(function() {
      $('.main-header__inner__nav__menu__like__link__icon').css("color", "#cccccc")
      $('.header3').css("color", "#3d3d3d");
      })
    );

    // お知らせ

    header_notification.hover(function() {
      $('.header4, .main-header__inner__nav__menu__notification__link__icon').css("color", "#0295EE");
    },(function() {
      $('.main-header__inner__nav__menu__notification__link__icon').css("color", "#cccccc")
      $('.header4').css("color", "#3d3d3d");
      })
    );

    // やることリスト

    header_todo.hover(function() {
      $('.header5, .main-header__inner__nav__menu__todo__link__icon').css("color", "#0295EE");
    },(function() {
      $('.main-header__inner__nav__menu__todo__link__icon').css("color", "#cccccc")
      $('.header5').css("color", "#3d3d3d");
      })
    );

    // マイページ

    header_mypage.hover(function() {
      $('.header6').css("color", "#0295EE");
    },(function() {
      $('.header6').css("color", "#3d3d3d");
      })
    );
  });
});