$(document).on('turbolinks:load',function() {
  $(function() {
    let $todo = $('.main-container__contents__notification-todo__tabs1__todo__1');
    let $notice = $('.main-container__contents__notification-todo__tabs1__notice__1');
    let main = {
      "background-color":"#fff",
      "border-top":"2px solid #ea352d"
    }
    let sub = {
      "background-color":"#EEEEEE",
      "border-top":"none"
    }

    $todo.click(function() {
      $(this).css(main);
      $notice.css(sub);
    });
    $notice.click(function() {
      $(this).css(main);
      $todo.css(sub);
    });

    $todo.hover(function() {
      $(this).css('opacity','0.5');
    },(function() {
      $(this).css('opacity','1');
      })
    );

    $notice.hover(function() {
      $(this).css('opacity', '0.5');
    },(function() {
      $(this).css('opacity', '1');
      })
    );

    let $transaction = $('.main-container__contents__purchaced__tabs2__notice__1');
    let $past = $('.main-container__contents__purchaced__tabs2__todo__1');

    $transaction.click(function() {
      $(this).css(main);
      $past.css(sub);
    });
    $past.click(function() {
      $(this).css(main);
      $transaction.css(sub);
    });

    $transaction.hover(function() {
      $(this).css('opacity','0.5');
    },(function() {
      $(this).css('opacity', '1');
      })
    );

    $past.hover(function() {
      $(this).css('opacity','0.5');
    },(function() {
      $(this).css('opacity', '1');
      })
    );
  });

  $(function() {
    let $user_information_link = $('.main-container__contents__user-icon__link');
    let $mypage_user_name = $('.main-container__contents__user-icon__link__name');

    $user_information_link.hover(function() {
      $(this).css('opacity','0.7');
      $mypage_user_name.css('style.textDecoration','underline');
    },(function() {
      $(this).css('opacity', '1');
      })
    );
  });
})