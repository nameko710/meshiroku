class UsersController < ApplicationController
  def show
    @name = current_user.name
  end

  def graph
  end

end
