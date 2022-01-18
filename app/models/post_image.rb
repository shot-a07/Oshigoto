class PostImage < ApplicationRecord
  
   belongs_to :user
   attachment :image
   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   
   
   def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
   end
   
   
    def self.looks(search, word)
     	if search == "perfect_match"
     		@post_image = PostImage.where("title LIKE?", "#{word}")
     	elsif search == "forward_match"
     		@post_image = PostImage.where("title LIKE?", "#{word}%")
     	elsif search == "backward_match"
     		@post_image - PostImage.where("title LIKE?", "%#{word}")
     	elsif search == "partial_match"
     		@post_image =  PostImage.where("title LIKE", "%#{word}")
     	else
     		@post_image = PostImage.all
     	end
    end
end