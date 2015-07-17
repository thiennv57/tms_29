class UsersController < ApplicationController
  before_action :init_user, only: [:show]

  private
  def init_user
    @user = User.find params[:id]
  end
end
