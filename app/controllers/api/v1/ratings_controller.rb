class Api::V1::RatingsController < Api::V1::BaseController

  def index
    ratings = Rating.order('created_at');
    ratings = Rating.where("flow_id=?",params[:flow_id]) if params[:flow_id].present?


    render json: {status: 'SUCCESS', message:'Loaded ratings', data:ratings},status: :ok
  end
  def show
    rating = Rating.find(params[:id])
    render json: { status: 'SUCCESS', message:'Loaded ratings', data:rating},status: :ok
  end


  def create
    rating = Rating.new(rating_params)
    rating.user = User.find(params[:user_id])

    if rating.save
      render json: {status: 'SUCCESS', message:'Saved rating', data:rating},status: :ok
    else
      render json: {status: 'ERROR', message:'Rating created', data:rating.errors},status: :unprocessable_entity
    end
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.destroy
    render json: {status: 'SUCCESS', message:'Deleted article', data:rating},status: :ok
  end

  def update
    rating = Rating.find(params[:id])
    if rating.update_attributes(rating_params)
      render json: {status: 'SUCCESS', message:'Updated article', data:rating},status: :ok
    else
      render json: {status: 'ERROR', message:'Article not updated', data:rating.errors},status: :unprocessable_entity
    end
  end

  private

  def rating_params
   params.permit(:user_id, :flow_id, :rating)
 end
end



