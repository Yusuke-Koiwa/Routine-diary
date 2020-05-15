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
    let date = $(this).parent().attr("id");
    let input = buildInput(date);
    $("#new-task-form").append(input);
    $(".form__title--active").text(date);
    $("#modal-wrapper").fadeIn();
    $("#new-task").fadeIn();

    $(".close-btn").on("click", function(){
      $("#modal-wrapper").fadeOut();
      $("#new-task").fadeOut();
    })
    
    $("#new-task-form").on("submit", function(){
      $("#task-submit").css('pointer-events', 'none');
      setTimeout(function(){
        location.reload();
      },100);
    })
  })
});