class PostCommentsController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = @post_image.id
    comment.save
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    PostComment.find_by(id: params[:id]).destroy
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
