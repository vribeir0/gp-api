require 'rails_helper'

describe Api::UsersController, type: :controller do

  context "Users Controller Validation" do
    it "return all the users" do
      get :index
    end
  end
end