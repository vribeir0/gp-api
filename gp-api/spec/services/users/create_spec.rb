require 'rails_helper' 

describe Users::Create do
  let(:user) { create(:user) }
  let(:params) { create_params }

  context "User validation" do
    context "with valid params" do
      before(:each) do
        create_list(:user, 5) 
      end

      it 'is valid with valid attributes' do
        expect { described_class.call(params) }.to \
          change(User, :count)
      end

      it 'is not valid without a unique email' do
        params[:email] = user[:email]
    
        expect { described_class.call(params) }.to \
          raise_exception(ActiveRecord::RecordInvalid)
      end
    end

    context "with unvalid params" do 
      it 'is not valid without email' do
        params[:email] = nil
        expect { described_class.call(params) }.to \
          raise_exception(ActiveRecord::RecordInvalid)
      end
  
      it 'is not valid without name' do
        params[:name] = nil
  
        expect { described_class.call(params) }.to \
          raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end

  def create_params 
    {
      name: user[:name],
      email: 'test@email.com',
      password: 'password'
    }
  end
end