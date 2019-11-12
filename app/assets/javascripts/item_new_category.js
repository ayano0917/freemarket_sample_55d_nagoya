$(document).on('turbolinks:load', function() {
  $('#parent_category').change(function () {
    var parent_id = $('#parent_category option:selected').val();
    if (parent_id.length != 0){
      $('#category-child-1').removeClass('hide');
      disapperGrandchild();
      $.ajax({
        url: '/items/get_category_children',
        type: 'Get',
        data: {parent_id: parent_id},
        dataType: 'json'
      }).done(function(children){
        $('#category-child-1 option').remove();
        $('#category-child-2 option').remove();
        var insertHTML = `<option value="">---</option>`;
        children.forEach(function(child){
          insertHTML += appendOption(child);
        })
        $('#child_category').append(insertHTML);
      }).fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#category-child-1').addClass('hide');
      disapperGrandchild();
    }
  });
});