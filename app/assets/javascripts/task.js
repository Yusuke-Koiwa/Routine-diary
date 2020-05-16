$(function(){

  function buildInput(date) {
    let input = `<input type="hidden", name="start_time", value="${date}">
                  <input type="hidden", name="date", value="${date}">`
    return input
  }
  
  if ($('.has-events').length > 0) {
    let html = $('.has-events').find('a').has(('.new_task_link'));
    html.remove();
  }

  $(".new_task_link").on("click", function(){
    let date = $(this).children("input").val();
    let input = buildInput(date);
    $("#new-task-form").append(input);
    $(".form__title--active").text(date);
    $("#modal-wrapper").fadeIn();
    $("#new-task").fadeIn();
  })

  $("#task-edit-icon").on('click', function(){
    $("#edit-task").fadeIn();
    $("#modal-wrapper").fadeIn();
  });
});