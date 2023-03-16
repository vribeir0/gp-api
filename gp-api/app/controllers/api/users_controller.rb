module Api
  class UsersController < ApplicationController
    include ExceptionHandler
    include Response

    def create
      user = Users::Create.call(random_params)

      render json: user, serializer: UsersSerializer
    end

    private

    def create_params 
      params.permit('name', 'email', 'password')
    end

    def random_params 
      {
        name: params[:name],
        email: params[:email],
        password: params[:password]
      }
    end
  end
end