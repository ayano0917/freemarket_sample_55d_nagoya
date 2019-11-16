class MainsController < ApplicationController
  before_action :get_publishing_item, only: [:index]
  def index
    ranking1 = @publishing_item.group(:parent_id).order('count_parent_id DESC').limit(4).count(:parent_id).keys
    
    @category1 = Category.find_by(id: ranking1[0])
    @items1 = @publishing_item.where(parent_id: ranking1[0]).order('id DESC').limit(4)
    
    @category2 = Category.find_by(id: ranking1[1])
    @items2 = @publishing_item.where(parent_id: ranking1[1]).order('id DESC').limit(4)
    
    @category3 = Category.find_by(id: ranking1[2])
    @items3 = @publishing_item.where(parent_id: ranking1[2]).order('id DESC').limit(4)

    @category4 = Category.find_by(id: ranking1[3])
    @items4 = @publishing_item.where(parent_id: ranking1[3]).order('id DESC').limit(4)
  end

  def get_publishing_item
    @publishing_item = Item.where(buyer_id: nil)
  end

end