module Api
  class UsersController < ApplicationController
    include ExceptionHandler
    include Response

    before_action :set_user, only: [:update, :destroy]

    def index 
      render json: User.all , each_serializer: UsersSerializer
    end

    def create
      user = Users::Create.call(create_params)
      
      render json: user, serializer: UsersSerializer, status: :created
    end

    def update
      user = Users::Update.call(update_params, @user)
      
      render json: user, serializer: UsersSerializer
    end

    def destroy
      Users::Destroy.call(@user)

      render status: ok
    end

    private

    def set_user
      @user = User.find(update_params[:id])
    end

    def create_params 
      params.permit('name', 'email', 'password')
    end

    def update_params 
      params.permit(':id', 'name', 'password')
    end
  end
end