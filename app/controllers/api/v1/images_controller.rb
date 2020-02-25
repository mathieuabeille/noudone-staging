class Api::V1::ImagesController < Api::V1::BaseController

  def index
    images = Image.order('created_at');
    images = Image.where("flow_id=?",params[:flow_id]) if params[:flow_id].present?


    render json: {status: 'SUCCESS', message:'Loaded images', data:images},status: :ok
  end
  def show
    image = Image.find(params[:id])
    render json: { status: 'SUCCESS', message:'Loaded images', data:image},status: :ok
  end


  def create
    image = Image.new(image_params)
    image.user = User.find(params[:user_id])

    if image.save
      render json: {status: 'SUCCESS', message:'Saved image', data:image},status: :ok
    else
      render json: {status: 'ERROR', message:'Image created', data:image.errors},status: :unprocessable_entity
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    render json: {status: 'SUCCESS', message:'Deleted article', data:image},status: :ok
  end

  def update
    image = Image.find(params[:id])
    if image.update_attributes(image_params)
      render json: {status: 'SUCCESS', message:'Updated article', data:image},status: :ok
    else
      render json: {status: 'ERROR', message:'Article not updated', data:image.errors},status: :unprocessable_entity
    end
  end

  private

  def image_params
   params.permit(:user_id, :flow_id, :task_id, :image, :title, :description)
 end
end



