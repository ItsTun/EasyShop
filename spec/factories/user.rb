FactoryBot.define do

  sequence :email do |n|
    "example#{n}@example.com"
  end

  sequence :username do |n|
    "test-user#{n}"
  end

  sequence :name do |n|
    "Name#{n}"
  end

  sequence :contact_number do |n|
     "0942003849#{n}"
  end

  factory :user, :class => 'User' do
    email { generate(:email) }
    name { generate(:name) }
    user_name { generate(:username) }
    user_type { "customer" }
    contact_number { generate(:contact_number) }
    password {"changeme"}
    password_confirmation {"changeme"}
  end
end