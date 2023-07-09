class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    authorize @user
    @tasks = @user.tasks
    @task = Task.new
  end

  private

  def set_user
    @user = current_user
  end
end
