class FridgesController < ApplicationController
  def index
    @fridges = Fridge.all
  end

  def new
    @fridges = Fridge.new
  end 

  def create
    @fridge = Fridge.new(fridge_params)
    if @fridge.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def fridge_params
    params.require(:fridge).permit(:food, :amount, :unit, :price).merge(user_id: current_user.id)
  end

end
