class Api::V1::VideosController < Api::V1::BaseController

      def index
        videos = Video.order('created_at');
        videos = Video.where("flow_id=?",params[:flow_id]) if params[:flow_id].present?


        render json: {status: 'SUCCESS', message:'Loaded videos', data:videos},status: :ok
      end
      def show
        video = Video.find(params[:id])
        render json: { status: 'SUCCESS', message:'Loaded videos', data:video},status: :ok
      end


      def create
        video = Video.new(video_params)
        video.user = User.find(params[:user_id])

        if video.save
          render json: {status: 'SUCCESS', message:'Saved video', data:video},status: :ok
        else
          render json: {status: 'ERROR', message:'Video created', data:video.errors},status: :unprocessable_entity
        end
      end

      def destroy
        video = Video.find(params[:id])
        video.destroy
        render json: {status: 'SUCCESS', message:'Deleted article', data:video},status: :ok
      end

      def update
        video = Video.find(params[:id])
        if video.update_attributes(video_params)
          render json: {status: 'SUCCESS', message:'Updated article', data:video},status: :ok
        else
          render json: {status: 'ERROR', message:'Article not updated', data:video.errors},status: :unprocessable_entity
        end
      end

      private

      def video_params
       params.permit(:user_id, :flow_id, :task_id, :video, :title, :description)
     end
   end



