class PostImagesController < ApplicationController
  impressionist actions: [:show] # showアクションで閲覧数確認のため追加

  def new
    @post_image = PostImage.new

  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path

  end

  def index
    @post_images = PostImage.page(params[:page]).per(4).order('id DESC')


  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    impressionist(@post_image, nil, unique: [:session_hash.to_s])  # 閲覧数確認のため追加

  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end


  private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :caption)
  end

end
