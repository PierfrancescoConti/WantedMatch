#require "rails_helper"

Given("I am on the New User page") do
  visit "users/new"
end

Given("I have filled all fields") do
  fill_in 'Usname', with: 'pippo'
  fill_in 'Email', with: 'pippo@pippo.it'
  fill_in 'Password', with: 'pippopippo0'
  fill_in 'Confirm Password', with: 'pippopippo0'
end


When("I click on Continue") do

  click_button('Continue')
end

Then("I should be able to Log in with my new account") do
  visit login_url
  fill_in('usname', with: 'pippo')
  fill_in('password', with: 'pippopippo0')
  click_button('Login')
  expect(page).to have_content("Teams")
end
