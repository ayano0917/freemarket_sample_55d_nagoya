class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_form
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_before_shipping
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :category, optional: true
  belongs_to :seller, class_name: "User", foreign_key: 'seller_id'
  belongs_to :buyer, class_name: "User", foreign_key: 'buyer_id', optional: true
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand

  validates :name,  presence: true, length: { maximum: 40}
  validates :description, presence: true, length: {maximum: 1000}
  validates :parent_id, presence: true, numericality: { only_integer: true}
  validates :child_id,  presence: true, numericality: { only_integer: true}
  validates :condition_id,  presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_form_id,  presence: true
  validates :prefecture_id, presence: true
  validates :days_before_shipping_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}


  def previous
    Item.where("id < ?",id).order("id DESC").first
  end

  def next
    Item.where("id > ?", id).order("id ASC").first
  end
end
