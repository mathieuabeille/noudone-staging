class Api::V1::UsersController < Api::V1::BaseController
			def index
				users = User.order('created_at');
				render json: {status: 'SUCCESS', message:'Loaded users', data:users},status: :ok
			end
      def show
       user = User.find(params[:id])
       render json: { status: 'SUCCESS', message:'Loaded users', data:user},status: :ok
     end


     def create
      user = User.new(user_params)

      if user.save
        render json: {status: 'SUCCESS', message:'Saved user', data:user},status: :ok
      else
        render json: {status: 'ERROR', message:'User created', data:user.errors},status: :unprocessable_entity
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      render json: {status: 'SUCCESS', message:'Deleted article', data:user},status: :ok
    end

    def update
      user = User.find(params[:id])
      if user.update_attributes(user_params)
        render json: {status: 'SUCCESS', message:'Updated article', data:user},status: :ok
      else
        render json: {status: 'ERROR', message:'Article not updated', data:user.errors},status: :unprocessable_entity
      end
    end

    private

    def user_params
     params.permit(:firstName, :lastName, :nickName, :email, :password, :avatarUrl)
   end
 end


