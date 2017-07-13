FactoryGirl.define do
  factory :job do
    title "Assistant to the Dev"
    description "Mostly getting coffee"
    level_of_interest "99"
    city "Fargo"
    company
  end

  factory :company do
    sequence :name do |n|
      "#{n} Goodwill"
    end
  end
end
