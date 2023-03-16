module Users  
  class Create < BaseService
    def initialize(params)
      @params = params
    end

    def call
      User.create!(data)
    end

    private

    attr_accessor :params

    def data 
      {
        name: params[:name],
        email: params[:email],
        password: params[:password]
      }
    end
  end
end