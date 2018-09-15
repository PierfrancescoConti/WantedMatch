#require "rails_helper"

Given("I'm registered") do
  visit "users/new"
  fill_in 'Usname', with: 'pippo'
  fill_in 'Email', with: 'pippo@pippo.it'
  fill_in 'Password', with: 'pippopippo0'
  fill_in 'Confirm Password', with: 'pippopippo0'
  click_button('Continue')
  fill_in('usname', with: 'pippo')
  fill_in('password', with: 'pippopippo0')
  click_button('Login')
end

When("I click create team botton") do
    click_link("=")
    click_link("Create Team")
end

Then("I should see the create team page") do
  expect(page).to have_content("Scegli Stemma")
end
