class PostImagesController < ApplicationController
  impressionist actions: [:show] # showアクションで閲覧数確認のため追加

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      # 画像認識機能
      tags = Vision.get_image_data(@post_image.image)
      tags.each do |tag|
        @post_image.tags.create(name: Transration.translate(tag))
      end
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page]).per(4).order('id DESC')
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    impressionist(@post_image, nil, unique: [:session_hash.to_s])  # 閲覧数確認のため追加
  end


  def edit
    @post_image = PostImage.find(params[:id])
  end
  
  def update
    post_image = PostImage.find(params[:id])
    post_image.update(post_image_params)
    redirect_to post_image_path(post_image)
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
