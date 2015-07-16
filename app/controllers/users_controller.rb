class UsersController < ApplicationController
  def show
  end

  private
  def init_user
    @user = User.find params[:id]
  end
end
