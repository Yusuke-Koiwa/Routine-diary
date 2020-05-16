$(function(){

  $("#new-routine-icon").on('click', function(){
    $("#new-routine").fadeIn();
    $("#modal-wrapper").fadeIn();
  });

  $(".routine__icon--edit").on('click', function(){
    let index = $(this).attr("id")
    $(`#edit-routine-${index}`).fadeIn();
    $("#modal-wrapper").fadeIn();
  });

})