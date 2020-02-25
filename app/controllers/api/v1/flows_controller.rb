class Api::V1::FormsController < Api::V1::BaseController

  def index
    flows = Flow.order('created_at');
    flows = Flow.where("user_id=?",params[:user_id]) if params[:user_id].present?


    render json: {status: 'SUCCESS', message:'Loaded flows', data:flows},status: :ok
  end
  def show
    flow = Flow.find(params[:id])
    render json: { status: 'SUCCESS', message:'Loaded flows', data:flow},status: :ok
  end


  def create
    flow = Flow.new(flow_params)
    flow.user = User.find(params[:user_id])

    if flow.save
      render json: {status: 'SUCCESS', message:'Saved flow', data:flow},status: :ok
    else
      render json: {status: 'ERROR', message:'Flow created', data:flow.errors},status: :unprocessable_entity
    end
  end

  def destroy
    flow = Flow.find(params[:id])
    flow.destroy
    render json: {status: 'SUCCESS', message:'Deleted article', data:flow},status: :ok
  end

  def update
    flow = Flow.find(params[:id])
    if flow.update_attributes(flow_params)
      render json: {status: 'SUCCESS', message:'Updated article', data:flow},status: :ok
    else
      render json: {status: 'ERROR', message:'Article not updated', data:flow.errors},status: :unprocessable_entity
    end
  end

  private

  def flow_params
   params.permit(:user_id, :status, :title, :description, :backgroundImage, :teaser)
 end
end



