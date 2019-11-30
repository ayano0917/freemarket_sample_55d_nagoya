// $(document).on('turbolinks:load', function() { //出品ページに遷移後リロード
// // モーダルウィンドウ
//   $(function(){
//     $(".item-sell-btn").on('click',function(){
//       $(".item-create,.item-create__box").fadeIn();
//     });
//     locateCenter();  // => モーダルウィンドウを中央配置するための初期値を設定する
//     $(window).resize(locateCenter);  // => ウィンドウのリサイズに合わせて、モーダルウィンドウの配置を変える
  
//     // モーダルウィンドウを中央配置するための配置場所を計算する関数
//     function locateCenter() {
//       let w = $(window).width();
//       let h = $(window).height();
      
//       let cw = $(".item-create__box").outerWidth();
//       let ch = $(".item-create__box").outerHeight();
      
//       $(".item-create__box").css({
//         'left': ((w - cw) / 2) + 'px',
//         'top': ((h - ch) / 3.5) + 'px'
//       });
//     }
//   });
// });