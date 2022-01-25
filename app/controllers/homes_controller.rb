class HomesController < ApplicationController

  def top
    @post_like_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').pluck(:post_image_id))
  end
end
