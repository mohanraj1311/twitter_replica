require 'rails_helper'

RSpec.describe "GenerateTweets", type: :request do
    it "This generates new tweets" do
      twet = FactoryGirl.create(:tweet)
  end
end
