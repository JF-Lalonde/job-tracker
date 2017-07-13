require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    job = create(:job)

    visit company_jobs_path(job.company.id)

    click_on "Edit"
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"


    click_button "Update"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content(job.company.name)
    expect(page).to have_content("Developer")
    expect(page).to_not have_content("Assistant")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
