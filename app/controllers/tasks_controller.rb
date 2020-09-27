class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @categories = current_user.categories.paginate(page: params[:page], per_page: 20)
    @task = Task.new
    @tasks = current_user.tasks.paginate(page: params[:page], per_page: 50)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:success] = "Task created!"
      redirect_back(fallback_location: root_url)
    else
      flash[:danger] = "Task failed: #{@task.errors.full_messages}"
      redirect_back(fallback_location: root_url)
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @task.update(task_params)
      flash[:success] = "Task updated!"
      redirect_back(fallback_location: root_url)
    else
      flash[:danger] = "Task update failed: #{@task.errors.full_messages}"
      redirect_back(fallback_location: root_url)
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_all
    current_user.tasks.delete_all
    flash[:success] = "Task updated!"
    redirect_back(fallback_location: root_url)
  end

  def delete_completed
    current_user.tasks.where(completed: true).delete_all
    flash[:success] = "Deleted completed"
    redirect_back(fallback_location: root_url)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :priority, :completed, :deadline, category_ids: [])
  end
end
