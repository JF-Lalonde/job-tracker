require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create!(title: "Sanitations")
    category_two = Category.create!(title: "Education")

    visit categories_path

    expect(page).to have_content "Sanitations"
    expect(page).to have_content "Education"
  end
end
