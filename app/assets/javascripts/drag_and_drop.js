document.addEventListener("turbolinks:load", function() {
  $(function  () {
    $("#pending_list, #in_progress_list, #completed_list").sortable({
      connectWith: '.task-type-col',

      update: function(e, ui) {
        console.log(this.id + ' >> ' + $(this).sortable('serialize'));

        $.ajax({
          url: $(this).data('url'),
          type: "PATCH",
          data: $(this).sortable('serialize'),
          success: function(response) {}
        });
      }

    });
  });
});
