class Api::V1::ChecklistsController < Api::V1::BaseController

      def index
        checklists = Checklist.order('created_at');
        checklists = Checklist.where("flow_id=?",params[:flow_id]) if params[:flow_id].present?


        render json: {status: 'SUCCESS', message:'Loaded checklists', data:checklists},status: :ok
      end
      def show
        checklist = Checklist.find(params[:id])
        render json: { status: 'SUCCESS', message:'Loaded checklists', data:checklist},status: :ok
      end


      def create
        checklist = Checklist.new(checklist_params)
        checklist.user = User.find(params[:user_id])

        if checklist.save
          render json: {status: 'SUCCESS', message:'Saved checklist', data:checklist},status: :ok
        else
          render json: {status: 'ERROR', message:'Checklist created', data:checklist.errors},status: :unprocessable_entity
        end
      end

      def destroy
        checklist = Checklist.find(params[:id])
        checklist.destroy
        render json: {status: 'SUCCESS', message:'Deleted article', data:checklist},status: :ok
      end

      def update
        checklist = Checklist.find(params[:id])
        if checklist.update_attributes(checklist_params)
          render json: {status: 'SUCCESS', message:'Updated article', data:checklist},status: :ok
        else
          render json: {status: 'ERROR', message:'Article not updated', data:checklist.errors},status: :unprocessable_entity
        end
      end

      private

      def checklist_params
       params.permit(:user_id, :flow_id, :question, :answer)
     end
   end



