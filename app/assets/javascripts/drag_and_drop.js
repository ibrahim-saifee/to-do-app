document.addEventListener("turbolinks:load", function() {
  $(function  () {
    $("#pending-list, #in-progress-list, #completed-list").sortable({connectWith: '.task-type-col'});
  });
});
