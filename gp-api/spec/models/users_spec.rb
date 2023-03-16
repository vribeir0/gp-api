# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  let(:user) { create(:user) }
  
  context "validation" do
    it 'is valid with valid attributes' do
      expect(user).to be_valid    
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid        
    end

    it 'is not valid without a email' do
      user.email = nil
      expect(user).to_not be_valid        
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid        
    end
  end
end
