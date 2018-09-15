Given("i'm registraded user") do
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
  click_link("=")
  click_link("Create A Match")
end

Then("I should create a team") do
  click_on('Scegli Team')
  click_on('Choose')
  choose('match[tipo]', option: 'calcio a 5')
  fill_in('Location', with: 'Roma')
  fill_in('match_time', with: '21:00')
  fill_in('match_date', with: '10/10/2018')
  click_on('Posta Annuncio')
end

