feature 'Add new booking' do
  scenario 'user can add a new booking' do
    connection = PG.connect(dbname: 'makersbnb_test')
    visit ('/')
    click_button(:add_space) 
    fill_in 'booked', with: "2021-12-01"
    fill_in 'to_date', with: "2021-12-31"
    click_button(:submit) 
    expect(page).to have_content "Monsters Inc"

  end
end
