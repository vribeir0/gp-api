module Users
  class Update < BaseService
    def initialize(params:, user:)
      @params = params
      @user = user
    end

    def call
      user.update!(data)
    end

    private

    attr_accessor :user
    attr_reader :params

    def data
      {
        name: params[:name],
        password: params[:password]
      }
    end
  end
end 