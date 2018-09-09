#require "rails_helper"

Given("I am in some page") do
  visit home_path
end

When("I click on Logout") do
    click_link('Logout')
end

Then("I should see 'logged out'") do
  expect(page).to have_content("logged out")
end
