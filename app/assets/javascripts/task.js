$(function(){
  
  if ($('.has-events').length > 0) {
    let html = $('.has-events').find('a').has(('.new_task_link'));
    html.remove();
  }

});