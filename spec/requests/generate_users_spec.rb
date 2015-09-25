require 'rails_helper'

RSpec.describe "Generate Users", type: :request do
  it "generates a single user" do
    user = FactoryGirl.create(:user)
  end
end
