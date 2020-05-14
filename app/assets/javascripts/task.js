$(function(){
  
  if ($('.has-events').length > 0) {
    let html = $('.has-events').find('a').has(('.new_task_link'));
    html.remove();
  }

  $("#praise-tab").on('click', function(){
    $("#comment-tab").removeClass("selected");
    $("#praise-tab").addClass("selected");
    $("#comments-window").hide();
    $("#praised_user-window").show();
  })

  $("#comment-tab").on('click', function(){
    $("#praise-tab").removeClass("selected");
    $("#comment-tab").addClass("selected");
    $("#praised_user-window").hide();
    $("#comments-window").show();
  })

});