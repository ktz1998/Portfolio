class Public::ItemsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]
  
  def ensure_correct_user
    @item = Item.find(params[:id])
    unless @item.user == current_user
      flash[:alert] = "権限がありません"
      redirect_to items_path
    end
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to items_path, notice: '投稿が完了しました。'
    else
      flash.now[:alert] = '投稿に失敗しました。文字数など内容を再確認してください。'
      render "new"
    end
  end

  def index
    if params[:tag_id].present?
      @items = Item.includes(:tags).where(tags: {id: params[:tag_id]}).page(params[:page]).per(8)
    else
      @items = Item.page(params[:page]).per(8)
    end
    @tags = Tag.all
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
      redirect_to item_path(@item), notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました。文字数などを再度確認してください。"
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
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
