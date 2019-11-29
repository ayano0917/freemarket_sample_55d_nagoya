require 'rails_helper'

describe SignUpsController, type: :controller do

  # newアクション

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  # registerアクション

  describe 'GET #register' do
    it "render the :register templete" do
      get :register
      expect(response).to render_template :register
    end
  end

  # # authenticationアクション
  # describe 'GET #authentication' do
  #   it "render the :authentication templete" do
  #     user = build(:user)
  #     get :authentication
  #     expect(response).to render_template :shipping_address, action: new
  #   end
  # end

  # describe '#create' do
  #   let(:params) { { provider: session[:provider], uid: session[:uid], nickname: session[:nickname], email: session[:email],   } }

  #   context 'log in' do
  #     # この中にログインしている場合のテストを記述
  #       before do
  #         login user
  #       end

  #     it 'redirect_to new_shipping_address_path' do
  #       post :create, params: params
  #       expect(response).to redirect_to new_shipping_address_path
  #     end
  #   end
  # end

  # completeアクション
  describe 'GET #complete' do
    it "render the :complete templete" do
      get :complete
      expect(response).to render_template :complete
    end
  end


end