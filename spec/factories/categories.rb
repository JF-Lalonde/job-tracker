FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "#{n} Category"
    end
  end
end
