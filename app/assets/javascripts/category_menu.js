$(document).on('turbolinks:load', function() {
  $(function() {
    let category = $('.main-header__inner__nav__search__category__link');
    let category_list = $('.main-header__inner__nav__search__category__link__inner__lists');

    let brand = $('.main-header__inner__nav__search__brand__link')

    category.hover(function() {
      $('.header1').css("color", "#0295EE");
      category_list.show();
      category_list.append('<li>レディース<br>メンズ<br>ベビー・キッズ<br>インテリア・住まい・小物<br>本・音楽・ゲーム<br>おもちゃ・ホビー・グッズ<br>コスメ・香水・美容<br>スポーツ・レジャー<br>ハンドメイド<br>チケット<br>自動車・オートバイ<br>その他<br>カテゴリー一覧</li>');
    },(function() {
      $('.header1').css("color", "#333333");
      category_list.hide();
      $('li').remove();
      })
    );

    brand.hover(function() {
      $('.header2').css("color", "#0295EE");
      category_list.show();
      category_list.append('<li>レディース<br>メンズ<br>ベビー・キッズ<br>インテリア・住まい・小物<br>本・音楽・ゲーム<br>おもちゃ・ホビー・グッズ<br>コスメ・香水・美容<br>スポーツ・レジャー<br>ハンドメイド<br>チケット<br>自動車・オートバイ<br>その他<br>カテゴリー一覧</li>');
    },(function() {
      $('.header2').css("color", "#333333");
      category_list.hide();
      $('li').remove();
      })
    );

  });
});