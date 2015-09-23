require 'capybara/rspec'

RSpec.feature "Generate tweets" do
  
  scenario "generate a tweet" do
    tweet = create(:tweet)
    visit show_path(tweet)
    expect(page).to have_content('test message')
  end
end
