class EatsController < ApplicationController
  def index
    @eats = Eat.all
  end
  
  def new
    @eat = Eat.new
    @form = Form::FridgeCollection.new
    @fridges = current_user.fridges
  end

  def create
    @eat = Eat.new(eat_params)
    @form = Form::FridgeCollection.new(fridge_collection_params)
      Eat.transaction do
        @eat.save!
        @form.update
      end
        redirect_to action: :index
      rescue => e
        @fridges = current_user.fridges
        render :new
  end

  private
    def eat_params
      params.require(:form_fridge_collection)
      .permit(:title, :image, :price, :comment, :date).merge(user_id: current_user.id)
    end

    def fridge_collection_params
      params.require(:form_fridge_collection)
      .permit(fridges_attributes: [:id, :amount]).merge(user_id: current_user.id)
    end

end
