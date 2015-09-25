FactoryGirl.define do
  factory :user do
    email "test@gmail.com"
    password "20october"
    password_confirmation "20october"
  end
  factory :tweet do
    message "test message"
    user_id 1
  end
end
