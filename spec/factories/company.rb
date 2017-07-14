FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "#{n} Company"
    end
  end
end
