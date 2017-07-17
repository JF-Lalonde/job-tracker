require 'rails_helper'

describe "User creates a new job" do
  scenario "a user selects corresponding category from dropdown menu" do

    company = Company.create!(name: "Exxon")
    category = Category.create!(title: "Environment")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Oil Tycoon"
    fill_in "job[description]", with: "Screw Earth!"
    fill_in "job[level_of_interest]", with: 50
    fill_in "job[city]", with: "Houston"
    page.find("#job_category_id").click

    expect(page).to have_link "New Category"

    within(".job_form") do
      select "Environment"
    end
    click_button "Create Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Houston")
    expect(page).to have_content("Environment")
  end

  #Sad path if user doesn't select a category from dropdown menu
end
