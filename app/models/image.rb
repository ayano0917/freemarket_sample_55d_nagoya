class Image < ApplicationRecord
  # アイテム用のイメージモデル
  belongs_to :item, optional: true
  mount_uploader :image, ImageUploader
end
