class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_q, only: [:index, :search]

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
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました。文字数などを再度確認してください。"
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end
  
  def search
    @results = @q.result.page(params[:page]).per(8)
    @tags = Tag.all
  end
  
   private
   
  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :review, :rate, tag_ids: [])
  end
  
  def set_q
    @q = Item.ransack(params[:q])
  end
end
