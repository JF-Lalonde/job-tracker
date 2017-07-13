require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    job = Job.create!(title: "Assistant", level_of_interest: 70, city: "Tacoma", company_id: company.id)

    visit companies_path
    click_on "ESPN"
    click_on "Assistant"
    click_on "Edit Job"
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"


    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to_not have_content("Assistant")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
