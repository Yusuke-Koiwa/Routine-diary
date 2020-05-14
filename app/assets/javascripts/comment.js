$(function(){

  function buildComment(comment){
    let html = `<div class="user">
                  <div class="user__left">
                    <a href="/users/${comment.user_id}">
                      <div class="user-info user-info--link">
                        <div class="user-info__name">
                          ${comment.user_name}
                        </div>
                        <div class="user-info__image">
                          <img src="${comment.user_image_url}">
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="comment-box">
                    <div class="comment-content">
                      ${comment.content}
                    </div>
                    <div class="comment-date">
                     ${comment.created_at}
                    </div>
                  </div>
                </div>`
    return html;
  }

  $("#comment-form").on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      let html = buildComment(data);
      $("#comments-index").append(html);
      $("form")[0].reset();
    })
    .fail(function() {
      alert("コメント送信に失敗しました");
    });
  });

});