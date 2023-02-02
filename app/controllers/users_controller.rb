class UsersController < ApplicationController
  def show
    @name = current_user.name
  end

  def graph
    @eats = current_user.eats.select("price", "date")
  end

end
