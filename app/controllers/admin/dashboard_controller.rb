class Admin::DashboardController < ApplicationController
  before_action :require_admin
  
  def index
    @users_length = User.count
    @courses_length = Course.count
    @subjects_length = Subject.count
  end
end
