class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_task, except: [:index, :new, :create]
  before_action :authorize_task, except: [:index, :new, :create]

  def index
    @tasks = filter_tasks.page(params[:page]).per(10)
    @task = Task.new
    authorize Task
  end

  def new
    @task = @user.tasks.build
    authorize @task
  end

  def create
    @task = @user.tasks.build(task_params)
    authorize @task

    if @task.save
      redirect_to tasks_path, notice: 'Task created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: 'Task deleted successfully.'
    else
      redirect_to tasks_path, alert: 'Failed to delete task.'
    end
  end

  def complete
    if @task.update(completed: true)
      redirect_to tasks_path, notice: 'Task marked as complete.'
    else
      redirect_to tasks_path, alert: 'Failed to mark task as complete.'
    end
  end

  def uncomplete
    if @task.update(completed: false)
      redirect_to tasks_path, notice: 'Task marked as incomplete.'
    else
      redirect_to tasks_path, alert: 'Failed to mark task as incomplete.'
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

  def filter_tasks
    if params[:search].present?
      @user.tasks.where("description LIKE ?", "%#{params[:search]}%")
    else
      @user.tasks
    end
  end

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
