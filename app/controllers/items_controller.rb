class ItemsController < ApplicationController
  def create
    @item = Item.create(item_params)
    redirect_to list_path(@item.list)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :item_date, :image).merge(list_id: params[:list_id], user_id: current_user.id)
  end

end
