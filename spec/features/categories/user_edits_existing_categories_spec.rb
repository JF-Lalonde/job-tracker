require 'rails_helper'

describe "User edits existing category" do
  scenario "a user edits an existing category" do
    category = Category.create!(title: "Education")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Parks and Rec"
    click_on "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content "Parks and Rec"
    expect(page).to_not have_content "Education"
  end
end
