class FridgesController < ApplicationController
  def index
    @fridges = current_user.fridges
  end

  def new
    @form = Form::FridgeCollection.new
  end 

  def create
    @form = Form::FridgeCollection.new(fridge_collection_params)
    if @form.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def fridge_collection_params
    params.require(:form_fridge_collection)
    .permit(fridges_attributes: [:food, :amount, :unit, :price]).merge(user_id: current_user.id)
  end

end
