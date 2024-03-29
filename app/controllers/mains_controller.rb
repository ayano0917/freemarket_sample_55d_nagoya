class MainsController < ApplicationController
  before_action :get_publishing_item, only: [:index, :search]
  def index
    ranking1 = @publishing_item.group(:parent_id).order('count_parent_id DESC').limit(4).count(:parent_id).keys

    @categories = Category.where(id: ranking1).order(['field(id, ?)', ranking1])
    
    @items1 = @publishing_item.where(parent_id: ranking1[0]).order('id DESC').limit(6)
    
    @items2 = @publishing_item.where(parent_id: ranking1[1]).order('id DESC').limit(6)
    
    @items3 = @publishing_item.where(parent_id: ranking1[2]).order('id DESC').limit(6)

    @items4 = @publishing_item.where(parent_id: ranking1[3]).order('id DESC').limit(6)

    ranking2 = @publishing_item.group(:brand_id).order('count_brand_id DESC').limit(4).count(:brand_id).keys

    @brands = Brand.where(id: ranking2).order(['field(id, ?)', ranking2])

    @items5 = @publishing_item.where(brand_id: ranking2[0]).order('id DESC').limit(6)

    @items6 = @publishing_item.where(brand_id: ranking2[1]).order('id DESC').limit(6)

    @items7 = @publishing_item.where(brand_id: ranking2[2]).order('id DESC').limit(6)

    @items8 = @publishing_item.where(brand_id: ranking2[3]).order('id DESC').limit(6)

  end

  def get_publishing_item
    @publishing_item = Item.where(buyer_id: nil, status: nil)
  end

  def search
    @items = @publishing_item.where('name  LIKE(?) OR description LIKE(?) ', "%#{params[:keyword]}%","%#{params[:keyword]}%").page(params[:page]).per(20)
  end

end