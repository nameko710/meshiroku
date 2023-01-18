class EatsController < ApplicationController
  def index
    @eats = Eat.all
  end
  
  def new
    @eat = Eat.new
  end

  def create
    @eat = Eat.new(eat_params)
    if @eat.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def eat_params
    params.require(:eat).permit(:image, :title, :price, :comment, :date).merge(user_id: current_user.id)
  end
end
