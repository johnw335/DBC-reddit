module ApplicationHelper
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def get_parent_comment(comment)
    parent_comment = comment
    while parent_comment.post == nil
      parent_comment = Comment.find(parent_comment.comment_id)
    end
    return parent_comment
  end
end
