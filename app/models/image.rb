class Image < ApplicationRecord
  # アイテム用のイメージモデル
  belongs_to :item 

  validates :content, presence: true

end
