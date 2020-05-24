$(function(){

  $(".praise-btn").on('click', function(){
    if ($(this).children("a").hasClass("good-job--on")) {
      let id = $(".current_user_id").val();
      $(".jscroll-praise").children(`#user-${id}`).remove();
    } else {
      if ($("#praised_user-window").length > 0)
      setTimeout(function(){
        location.reload();
      },100);
    }
  });
});