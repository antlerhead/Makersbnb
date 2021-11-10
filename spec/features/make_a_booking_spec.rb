feature 'Add new booking' do
  scenario 'user can add a new booking' do
    connection = PG.connect(dbname: 'makersbnb_test')
    # CREATE TABLE booking (id SERIAL PRIMARY KEY, space_id INTEGER, booked_date DATE, resident INTEGER, requested BIT, confirmed BIT);

    visit ('/')
    click_button(:add_space) # This takes us to a new page to fill in
    fill_in 'booked', with: "2021-12-01"
    fill_in 'to_date', with: "2021-12-31"
    click_button(:submit) # This takes us back to the listing page
    expect(page).to have_content "Monsters Inc"

  end
end
