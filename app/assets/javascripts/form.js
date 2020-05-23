$(function(){

  $(".close-btn").on('click', function(){
    $("#modal-wrapper").fadeOut();
    $("#new-task").fadeOut();
    $("#edit-task").fadeOut();
    $("#new-routine").fadeOut();
    $(".edit-routine").fadeOut();
  })

  $("#modal-wrapper").on('click', function(){
    $("#modal-wrapper").fadeOut();
    $("#new-task").fadeOut();
    $("#edit-task").fadeOut();
    $("#new-routine").fadeOut();
    $(".edit-routine").fadeOut();
  })

});