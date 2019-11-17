class Image < ApplicationRecord
  # アイテム用のイメージモデル
  belongs_to :item
  mount_uploader :image, ImageUploader

end
