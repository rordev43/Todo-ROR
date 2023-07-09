class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_task, except: [:new, :create]
  before_action :authorize_task, except: [:new, :create]

  def new
    @task = @user.tasks.build
    authorize @task
  end

  def create
    @task = @user.tasks.build(task_params)
    authorize @task

    if @task.save
      redirect_to user_path(@user), notice: 'Task created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to user_path(@user), notice: 'Task updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to user_path(@user), notice: 'Task deleted successfully.'
    else
      redirect_to user_path(@user), alert: 'Failed to delete task.'
    end
  end

  def complete
    if @task.update(completed: true)
      redirect_to user_path(@user), notice: 'Task marked as complete.'
    else
      redirect_to user_path(@user), alert: 'Failed to mark task as complete.'
    end
  end

  def uncomplete
    if @task.update(completed: false)
      redirect_to user_path(@user), notice: 'Task marked as incomplete.'
    else
      redirect_to user_path(@user), alert: 'Failed to mark task as incomplete.'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_task
    @task = @user.tasks.find(params[:id])
  end

  def authorize_task
    authorize @task
  end

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
