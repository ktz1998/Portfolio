class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @tags = Tag.all
    if params[:tag_id].present?
      @items = Item.includes(:tags).where(tags: {id: params[:tag_id]}).page(params[:page]).per(8)
    else
      @items = Item.page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end
  
  
   private
   
  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :review, :rate, tag_ids: [])
  end
end
