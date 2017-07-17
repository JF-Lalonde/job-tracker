require 'rails_helper'

describe "User creates comment" do
  scenario "a user views comment form for a job" do
    company = Company.create!(name: "Enron")
    job = company.jobs.create!(title: "Patsy", description: "Fall guy", level_of_interest: 20, city: "Houston")

    visit company_job_path(company, job)

    expect(page).to have_content("Patsy")
    expect(page).to have_content("Comment")
  end

  scenario "a user creates a comment for a job" do
    company = Company.create!(name: "Enron")
    job = company.jobs.create!(title: "Patsy", description: "Fall guy", level_of_interest: 20, city: "Houston")

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Awesome Job!"
    click_button "Create"

    expect(page).to have_content("Awesome Job!")
  end
end
