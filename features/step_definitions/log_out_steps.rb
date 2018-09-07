When /I sign in/ do
  within("#session") do
    fill_in 'Usname', with: 'pippo'
    fill_in 'Password', with: 'pippopippo0'
    click_link_or_button 'Login'
  end
end
