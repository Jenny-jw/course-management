$(function () {
  $("#sortable").sortable({
    update: function (event, ui) {
      $.post($("#sortable").data("url"), $(this).sortable("serialize"));
    },
  });
  $("#sortable").disableSelection();
});
