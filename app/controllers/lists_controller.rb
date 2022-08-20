class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @list = List.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @list= List.new(list_params)
    if @list.save
      redirect_to users_path(id: current_user.id)
    else
      render :new
    end
  end

  def show
    @list=List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:list_name, :list_text, :privacy_id).merge(user_id: current_user.id)
  end

end
