class Api::V1::BatchesController < Api::V1::BaseController

      def index
        batches = Batche.order('created_at');
        batches = Batche.where("flow_id=?",params[:flow_id]) if params[:flow_id].present?


        render json: {status: 'SUCCESS', message:'Loaded batches', data:batches},status: :ok
      end
      def show
        batche = Batche.find(params[:id])
        render json: { status: 'SUCCESS', message:'Loaded batches', data:batche},status: :ok
      end


      def create
        batche = Batche.new(batche_params)
        batche.user = User.find(params[:user_id])

        if batche.save
          render json: {status: 'SUCCESS', message:'Saved batche', data:batche},status: :ok
        else
          render json: {status: 'ERROR', message:'Batche created', data:batche.errors},status: :unprocessable_entity
        end
      end

      def destroy
        batche = Batche.find(params[:id])
        batche.destroy
        render json: {status: 'SUCCESS', message:'Deleted article', data:batche},status: :ok
      end

      def update
        batche = Batche.find(params[:id])
        if batche.update_attributes(batche_params)
          render json: {status: 'SUCCESS', message:'Updated article', data:batche},status: :ok
        else
          render json: {status: 'ERROR', message:'Article not updated', data:batche.errors},status: :unprocessable_entity
        end
      end

      private

      def batche_params
       params.permit(:user_id, :flow_id, :number)
     end
   end


