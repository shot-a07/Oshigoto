class Tag < ApplicationRecord
  
  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :post_image_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :post_images, through: :post_image_tag_relations, dependent: :destroy
end
