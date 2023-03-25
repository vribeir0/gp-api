module Users
  class Destroy < BaseService
    def initialize(user)
      @user = user
    end

    def call
      user.destroy!
    end

    private

    attr_accessor :user
  end
end 