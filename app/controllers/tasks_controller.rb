class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :toggle, :update, :destroy]
  before_action :authorize_task, only: [:update, :toggle, :destroy]

  def index
    @tasks = current_user.tasks
    @tasks = @tasks.search_by_description(params[:query]) if params[:query].present?
    
    @tasks = @tasks.page(params[:page]).per(5)
    @task = Task.new
    authorize @tasks
  end

  def new
    @task = current_user.tasks.new
    authorize @task
  end

  def create
    @task = current_user.tasks.new(task_params)
    authorize @task
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @task.update(completed: params[:completed])
  
    render json: { message: "Success" }
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: "Task was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_url, notice: "Post was successfully deleted."
    else
      redirect_to tasks_url, notice: "Something went wrong"
    end
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def authorize_task
    authorize @task
  end

  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
