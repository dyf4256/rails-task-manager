class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :destroy, :edit]
  def index
    @tasks = Task.all
    # raise
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(tasks_params)
    task.save
    redirect_to tasks_path
  end

  def edit
    # raise
  end

  def update
    # raise
    task = Task.find(params[:id])
    task.update(tasks_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_tasks
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
