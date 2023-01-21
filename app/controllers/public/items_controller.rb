class Public::ItemsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path(@item)
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

   private

  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :review, :rate, tag_ids: [])
  end
end
