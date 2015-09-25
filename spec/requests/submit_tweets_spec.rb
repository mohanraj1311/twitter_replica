require 'rails_helper'

RSpec.describe "SubmitTweets", type: :request do
    it "submits tweets" do
      user = FactoryGirl.create(:user)
      visit "/users/sign_in"
      fill_in "Email", :with => "test@gmail.com"
      fill_in "Password", :with => "20october"
      click_button "Log in"
      expect(page).to have_content('Signed in successfully')
      click_link('New Tweet')
      fill_in "Message", :with =>"Test message"
      click_button "Save"
      expect(page).to have_content('Tweet was successfully created')
  end
end
