class Api::V1::TasksController < Api::V1::BaseController

  def index
    tasks = Task.order('created_at');
    tasks = Task.where("flow_id=?",params[:flow_id]) if params[:flow_id].present?
    tasks = Task.where("user_id=?",params[:user_id]) if params[:user_id].present?
    render json: {status: 'SUCCESS', message:'Loaded tasks', data:tasks},status: :ok
  end
  def show
    task = Task.find(params[:id])
    render json: { status: 'SUCCESS', message:'Loaded tasks', data:task},status: :ok
  end


  def create
    task = Task.new(task_params)
    task.user = User.find(params[:user_id])

    if task.save
      render json: {status: 'SUCCESS', message:'Saved task', data:task},status: :ok
    else
      render json: {status: 'ERROR', message:'Task created', data:task.errors},status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: {status: 'SUCCESS', message:'Deleted article', data:task},status: :ok
  end

  def update
    task = Task.find(params[:id])
    if task.update_attributes(task_params)
      render json: {status: 'SUCCESS', message:'Updated article', data:task},status: :ok
    else
      render json: {status: 'ERROR', message:'Article not updated', data:task.errors},status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.permit(:flow_id, :user_id, :status, :title, :description, :backgroundImage, :time)
  end
end



