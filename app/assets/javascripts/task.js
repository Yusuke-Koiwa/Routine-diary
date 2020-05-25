$(function(){

  function buildInput(date) {
    let input = `<div id="hidden-params">
                    <input type="hidden", name="start_time", value="${date}", id: "new-start_date">
                    <input type="hidden", name="date", value="${date}", id: "new-date>
                </div>`
    return input
  }
  
  if ($('.has-events').length > 0) {
    let html = $('.has-events').find('a').has(('.new_task_link'));
    html.remove();
  }

  $(".new_task_link").on("click", function(){
    $("#hidden-params").remove();
    $("#score-field").show();

    let dateString = $(this).children(".date-string").val();
    let date = $(this).children(".date-date").val();
    let today = $("#date-today").val();
    let input = buildInput(dateString);

    if (date > today) {
      $("#score-field").hide();
    }
    $("#new-task-form").append(input);
    $(".form__title--active").text(dateString);
    $("#modal-wrapper").fadeIn();
    $("#new-task").fadeIn();
  })

  $("#task-edit-icon").on('click', function(){
    $("#edit-task").fadeIn();
    $("#modal-wrapper").fadeIn();
  });

  $("#category-box__title").hover(function() {
    $("#category-box__list").show();
  }, function() {
    $("#category-box__list").hide();
  });

  $("#category-box__list").hover(function() {
    $("#category-box__list").show();
  }, function() {
    $("#category-box__list").hide();
  });

});