require "rails_helper"

describe "User deletes a category" do
  scenario "a user deletes a category" do
    category = Category.create!(title: "Education")
    visit categories_path

    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Education was successfully deleted!")
  end
end
