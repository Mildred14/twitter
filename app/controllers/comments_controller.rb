class CommentsController < ApplicationController
  def create
    comment = current_user.posts.new(comment_params)
    parent = Post.find_by(id: params[:post_id])
    if parent.present?
      comment.parent_post_id = params[:post_id]
      if comment.save
        redirect_to posts_path, notice: "Post created"
      else
        redirect_to posts_path, alert: "Parent post doesn't exist"
      end
    else
      redirect_to posts_path, alert: "Parent post doesn't exist"
    end
  end

  private

  def comment_params
    params.require(:post).permit(:content)
  end
end
