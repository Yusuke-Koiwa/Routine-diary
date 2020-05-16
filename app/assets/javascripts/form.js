$(function(){

  $("#signup-btn").on('click', function(){
    $("#modal-wrapper").fadeIn();
    $("#new-registration").fadeIn();
  })

  $("#login-btn").on('click', function(){
    $("#modal-wrapper").fadeIn();
    $("#new-session").fadeIn();
  })

  $(".close-btn").on('click', function(){
    $("#modal-wrapper").fadeOut();
    $("#new-registration").fadeOut();
    $("#new-session").fadeOut();
    $("#new-task").fadeOut();
    $("#edit-task").fadeOut();
    $("#new-routine").fadeOut();
    $(".edit-routine").fadeOut();
  })

  $("#login-link").on('click', function(){
    $("#new-registration").fadeOut();
    $("#new-session").fadeIn();
  })

  $("#signup-link").on('click', function(){
    $("#new-session").fadeOut();
    $("#new-registration").fadeIn();
  })

  $("#modal-wrapper").on('click', function(){
    $("#modal-wrapper").fadeOut();
    $("#new-registration").fadeOut();
    $("#new-session").fadeOut();
    $("#new-task").fadeOut();
    $("#edit-task").fadeOut();
    $("#new-routine").fadeOut();
    $(".edit-routine").fadeOut();
  })

});