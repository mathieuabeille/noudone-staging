class Api::V1::FormsController < Api::V1::BaseController

      def index
        forms = Form.order('created_at');
        forms = Form.where("flow_id=?",params[:flow_id]) if params[:flow_id].present?


        render json: {status: 'SUCCESS', message:'Loaded forms', data:forms},status: :ok
      end
      def show
        form = Form.find(params[:id])
        render json: { status: 'SUCCESS', message:'Loaded forms', data:form},status: :ok
      end


      def create
        form = Form.new(form_params)
        form.user = User.find(params[:user_id])

        if form.save
          render json: {status: 'SUCCESS', message:'Saved form', data:form},status: :ok
        else
          render json: {status: 'ERROR', message:'Form created', data:form.errors},status: :unprocessable_entity
        end
      end

      def destroy
        form = Form.find(params[:id])
        form.destroy
        render json: {status: 'SUCCESS', message:'Deleted article', data:form},status: :ok
      end

      def update
        form = Form.find(params[:id])
        if form.update_attributes(form_params)
          render json: {status: 'SUCCESS', message:'Updated article', data:form},status: :ok
        else
          render json: {status: 'ERROR', message:'Article not updated', data:form.errors},status: :unprocessable_entity
        end
      end

      private

      def form_params
       params.permit(:user_id, :flow_id, :question, :answer)
     end
   end



