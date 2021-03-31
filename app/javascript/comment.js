// コメント編集機能・編集ボタンをクリックして編集画面を表示
$(function(){
  $(document).on('click',".js-edit-comment-button", function(){
    const commentId = $(this).data('comment-id');                       //comment.idを代入
    const commentContentArea = $('#comment-content-area-' + commentId); //一意のコメントを代入
    const commentTextArea = $('#js-textarea-comment-' + commentId);     //一意のコメントエリアを代入
    const commentButton = $('#js-comment-button-' + commentId);         //一意のボタンエリアを代入

    commentContentArea.hide();
    commentTextArea.show();
    commentButton.show();
  });
})

  // コメント編集機能・キャンセルボタンをクリックしてコメント編集エリアを非表示
$(function(){
  $(document).on('click', ".comment-cancel-button", function(){
    const commentId = $(this).data('cancel-id');
    const commentContentArea = $('#comment-content-area-' + commentId);
    const commentTextArea = $('#js-textarea-comment-' + commentId);
    const commentButton = $('#js-comment-button-' + commentId);
    const commentError = $('#js-comment-post-error-' + commentId);

    commentContentArea.show();
    commentTextArea.hide();
    commentButton.hide();
    commentError.hide();
  })
})

  // コメント編集機能・更新ボタンを押したら更新される
$(function(){
  $(document).on('click', ".comment-update-button", function(){
    const Id = $(this).data('update-id');                        //[0]department.id、[1]comment.id
    const departmentId = $(this).data('')
    const textField = $('#js-textarea-comment-' + Id[1]);        //一意のコメントエリアを代入
    const text = textField.val();                                //更新するコメント内容を取得

    $.ajax({
      url: '/departments/' + Id[0] + '/comments/' + Id[1],
      type: 'PATCH',
      data: {                                                    //commentモデルのtextカラムに変数textを格納
        comment: {
          text: text
        }
      }
    }).done(function(data){      //処理が成功した場合
      const commentContentArea = $('#comment-content-area-' + Id[1]);
      const commentTextArea = $('#js-textarea-comment-' + Id[1]);
      const commentButton = $('#js-comment-button-' + Id[1]);
      const commentError = $('#js-comment-post-error-' + Id[1])

      commentContentArea.show();
      commentContentArea.text(data.text);  //updateされたtextのvalueを取得
      commentTextArea.hide();
      commentButton.hide();
      commentError.hide();
    }).fail(function(){
      const commentError = $('#js-comment-post-error-' + Id[1])
      commentError.text('コメントを入力してください');
    })
  });
});