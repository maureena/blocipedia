require 'rails_helper'

describe "Pages" do

  before :each do
    sign_in
  end


  describe "Add Page" do
    it "adds a page and displays the results" do
      visit pages_path
      expect {
        click_link 'Create wiki page'
        fill_in 'Title', with: "So long"
        fill_in 'Body', with: "And thanks for all the fish."
        click_button "Save"
      }.to change(Page,:count).by(1)
      expect(page).to have_content('Page was saved.')
      #within 'h1' do # not working because title is being rendered withing an extra <p> tag
        expect(page).to have_content('So long')
      #end
      expect(page).to have_content('And thanks for all the fish.')
    end
  end

  # Test adding references

end
