class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @tasks = @user.tasks
    @task = Task.new
  end
end
