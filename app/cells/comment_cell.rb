class CommentCell < BaseCell
  cache :sidebar_latest_comments, :expires_in => 10.minutes
  def sidebar_latest_comments
    @comments = Comment.limit(10)
    render
  end

end
