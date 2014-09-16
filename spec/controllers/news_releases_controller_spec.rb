require 'rails_helper'

describe NewsReleasesController, type: :controller do
  describe 'GET #new' do
    it "requires login" do
      get :new
      expect(response).to require_login
    end
  end

  describe "POST #create" do
    it "requires login" do
      post :create, news_release: attributes_for(:news_release)
      expect(response).to require_login
    end
  end
end
