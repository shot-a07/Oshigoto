class PostImage < ApplicationRecord
  
   belongs_to :user                              # ユーザとの関係
   attachment :image                             # 画像表示
   has_many :post_comments, dependent: :destroy  # コメント機能
   has_many :favorites, dependent: :destroy      # いいね機能
   
   validates :title, presence: true
   validates :image, presence: true
    
   is_impressionable # 閲覧数確認のための記載　
   
   def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
   end
   
   
    def self.looks(search, word)                 # 検索
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