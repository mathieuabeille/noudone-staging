class Api::V1::InteractionsController < Api::V1::BaseController

  def index
    interactions = Interaction.order('created_at');
    interactions = Interaction.where("flow_id=?",params[:flow_id]) if params[:flow_id].present?


    render json: {status: 'SUCCESS', message:'Loaded interactions', data:interactions},status: :ok
  end
  def show
    interaction = Interaction.find(params[:id])
    render json: { status: 'SUCCESS', message:'Loaded interactions', data:interaction},status: :ok
  end


  def create
    interaction = Interaction.new(interaction_params)
    interaction.user = User.find(params[:user_id])

    if interaction.save
      render json: {status: 'SUCCESS', message:'Saved interaction', data:interaction},status: :ok
    else
      render json: {status: 'ERROR', message:'Interaction created', data:interaction.errors},status: :unprocessable_entity
    end
  end

  def destroy
    interaction = Interaction.find(params[:id])
    interaction.destroy
    render json: {status: 'SUCCESS', message:'Deleted article', data:interaction},status: :ok
  end

  def update
    interaction = Interaction.find(params[:id])
    if interaction.update_attributes(interaction_params)
      render json: {status: 'SUCCESS', message:'Updated article', data:interaction},status: :ok
    else
      render json: {status: 'ERROR', message:'Article not updated', data:interaction.errors},status: :unprocessable_entity
    end
  end

  private

  def interaction_params
   params.permit(:user_id, :flow_id, :task_id, :batch_id, :interactionType)
 end
end



