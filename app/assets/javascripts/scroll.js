$(function() {
  $(window).on('scroll', function(){
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
      $('.jscroll').jscroll({
        contentSelector: '.task-list',
        nextSelector: 'span.next:last a'
      });
      $('.jscroll-user').jscroll({
        contentSelector: '.user-list',
        nextSelector: 'span.next:last a'
      });
      $('.jscroll-praise').jscroll({
        contentSelector: '.jscroll-praise',
        nextSelector: 'span.next:last a'
      });
    }
  })
});