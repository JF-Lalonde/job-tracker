require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees one category" do
    category = Category.create!(title: "Semantics")

    visit category_path(category)

    expect(page).to have_content category.title
  end
end
