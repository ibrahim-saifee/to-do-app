document.addEventListener("turbolinks:load", function() {
  $(function  () {
    $("#pending_list, #in_progress_list, #completed_list").sortable({
      connectWith: '.task-type-col',

      update: function(e, ui) {
        $.ajax({
          url: $(this).data('url'),
          type: "PATCH",
          data: $(this).sortable('serialize') + '&task_type=' + this.id.replace('_list', ''),
          success: function(response) {}
        });
      }

    });
  });

  $('.datepicker').datepicker();
});
