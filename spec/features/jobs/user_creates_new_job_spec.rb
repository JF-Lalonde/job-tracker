require 'rails_helper'

describe "User creates a new job" do
  # scenario "a user can create a new job" do
  #   company = Company.create!(name: "ESPN")
  #   visit new_company_job_path(company)
  #
  #   fill_in "job[title]", with: "Developer"
  #   fill_in "job[description]", with: "So fun!"
  #   fill_in "job[level_of_interest]", with: 80
  #   fill_in "job[city]", with: "Denver"
  #
  #   click_button "Create"
  #
  #   expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
  #   expect(page).to have_content("ESPN")
  #   expect(page).to have_content("Developer")
  #   expect(page).to have_content("80")
  #   expect(page).to have_content("Denver")
  # end

  scenario "a user selects corresponding category from dropdown menu" do
    # As a user, when I visit the new Job page
    company = Company.create!(name: "Exxon")
    category = Category.create!(title: "Environment")
    visit new_company_job_path(company)
    #And I create a new job
    fill_in "job[title]", with: "Oil Tycoon"
    fill_in "job[description]", with: "Screw Earth!"
    fill_in "job[level_of_interest]", with: 50
    fill_in "job[city]", with: "Houston"
    # Then I am required to select a category from a dropdown menu
    page.find("#job_category_id").click
    #And I see a link to create new Category

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
