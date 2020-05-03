$(function(){
  
  if ($('.day').has($('i'))) {
    let html = $('i').parent().find('a').has('.new_task_link');
    html.remove();
  }

})