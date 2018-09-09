#require "rails_helper"

Given("I am on the Log in page") do
  visit login_url
end

Given("I have filled Usname and Pwd") do
  fill_in('usname', with: 'pippo')
  fill_in('password', with: 'pippopippo0')
end


When("I click on Sign in") do

  click_button('Login')
end

Then("I should see my profile page") do
  expect(page).to have_content("Teams")
end
