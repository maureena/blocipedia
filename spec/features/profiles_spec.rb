require 'rails_helper'

describe "Visiting profiles" do


  describe "not signed in" do

    before do
      @user = FactoryGirl.create(:user)
      @page = FactoryGirl.create(:page)
    end

    it "redirects to sign in" do
      visit user_path(@user)
      expect(current_path).to eq(new_user_session_path)
    end
  end

  describe "signed in" do

    before do
      sign_in
      @page = FactoryGirl.create(:page)
      Connection.create(editor_id: @user.id, page_id: @page.id)
    end

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@page.title)
    end

  end

end
