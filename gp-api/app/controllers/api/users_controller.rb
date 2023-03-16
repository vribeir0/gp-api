module Api
  class UsersController < ApplicationController
    include ExceptionHandler
    include Response

    def create
      user = Users::Create.call(create_params)

      render json: user, serializer: UsersSerializer
    end

    private

    def create_params 
      params.permit('name', 'email', 'password')
    end
  end
end