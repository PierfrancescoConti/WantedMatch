#require "rails_helper"

Given("I am a registered user") do
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

Given("I have a created team") do
  click_link("=")
  click_link("Create Team")
  fill_in('team_name', with: 'fantadora')
  click_on("Continue")
end

When("I click create team match button") do
  click_link("Create Match!")
end

When("I fill all fields") do
  click_on('Scegli Team')
  expect(page).to have_content('Choose')
  click_on('Choose')
  fill_in('match[team1]', with: Team.find_by(name: "fantadora").id)

  choose('match[tipo]', option: 'calcio a 5')
  fill_in('Location', with: 'Roma')
  fill_in('match_time', with: '21:00')
  fill_in('match_date', with: '10/10/2018')
end


Then("I should create a team") do
  click_on('Posta Annuncio')
  expect(page).to have_content("Match was successfully created")
end
