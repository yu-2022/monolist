class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :update, :destroy]

  def create
    @item = Item.create(item_params)
    redirect_to list_path(@item.list)
  end

  def edit
    @list = @item.list
    if @item.user_id != current_user.id
      redirect_to root_path
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def update
    if @item.update(item_params)
      redirect_to list_path(@item.list_id)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id != current_user.id
      redirect_to root_path
    else
      @item.destroy
      redirect_to list_path(@item.list)
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :item_date, :image).merge(list_id: params[:list_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
