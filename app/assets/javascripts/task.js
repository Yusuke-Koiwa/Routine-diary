$(function(){
  
  if ($('.day').hasClass($('.has-events'))) {
    let html = $('.has-events').find('a').has(('.new_task_link'));
    html.remove();
  }
})