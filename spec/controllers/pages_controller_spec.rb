require 'rails_helper'
require 'ruby_debug'

describe PagesController do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  
  describe "GET 'index'" do
    it "returns http success" do
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      page = FactoryGirl.create(:page)
      get :show, id: page
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      page = FactoryGirl.create(:page)
      get :edit, id: page
      expect(response).to be_success
    end
  end

end
