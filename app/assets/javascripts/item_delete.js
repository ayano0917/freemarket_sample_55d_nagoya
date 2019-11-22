$(document).on('turbolinks:load', function() {
  $('#item_delete').click(function(){
    if(!confirm('削除する代わりに停止することもできます。\n本当に削除しますか？')){
      return false;
    }
  });
});