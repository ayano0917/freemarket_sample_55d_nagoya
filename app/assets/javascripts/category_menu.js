$(document).on('turbolinks:load', function() {
  $(function() {
    let category = $('.main-header__inner__nav__search__category__link');
    let category_list = $('.main-header__inner__nav__search__category__link__inner__lists');

    let header_brand = $('.main-header__inner__nav__search__brand__link');
    let header_like = $('.main-header__inner__nav__menu__like__link');
    let header_notification = $('.main-header__inner__nav__menu__notification__link');
    let header_todo = $('.main-header__inner__nav__menu__todo__link');
    let header_mypage = $('.main-header__inner__nav__menu__mypage__link');

    category.hover(function() {
      $('.header1').css("color", "#0295EE");
      category_list.show();
      category_list.append('<li class="header__category__list">レディース<br>メンズ<br>ベビー・キッズ<br>インテリア・住まい・小物<br>本・音楽・ゲーム<br>おもちゃ・ホビー・グッズ<br>コスメ・香水・美容<br>スポーツ・レジャー<br>ハンドメイド<br>チケット<br>自動車・オートバイ<br>その他<br>カテゴリー一覧</li>');
    },(function() {
      $('.header1').css("color", "#333333");
      category_list.hide();
      $('header__category__list').remove();
      })
    );

    header_brand.hover(function() {
      $('.header2').css("color", "#0295EE");
    },(function() {
      $('.header2').css("color", "#333333");
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