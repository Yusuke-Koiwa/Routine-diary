$(function(){
  
  if ($('.day').has($('i'))) {
    let html = $('i').parent().parent().find('a').has(('.new_task_link'));
    html.remove();
  }

  if ($('.day').has($('.task_body'))) {
    let html = $('.task_body').parent().parent().find('a').has($('.new_task_link'));
    html.remove();
  }

})