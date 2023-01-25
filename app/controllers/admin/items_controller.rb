class Admin::ItemsController < ApplicationController
  def index
    @tags = Tag.all
    if params[:tag_id].present?
      @items =  Item.includes(:tags).where(tags: {id: params[:tag_id]})
    else
      @items = Item.all
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
