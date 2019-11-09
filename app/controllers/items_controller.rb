class ItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.new
    # @image = Image.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    # binding.pry
    # params[:item_images][:image].each do |i|
    params[:image].each do |i|
      @item.item_images.create(image: image, item_id: @item.id)
      # item.images.create!(name: image, item_id: item.id)
    redirect_to root_path 
    end
  end

  def confirm
  end
  
  private
  def item_params
    params.require(:item).permit(
      :user_id,
      :name,
      :description,
      :condition_id,
      :shipping_fee_id,
      :shipping_form_id,
      :prefecture_id,
      :days_before_shipping_id, 
      :size_id,
      :brand,
      # :category,
      :price,
      :buyer_id,
      :seller_id,
      :shipping_address, 
      :status,
      # :image,
      # images_attributes: [:image]
      item_images_attributes: [:image]

      # image:[]
    )
  end
end