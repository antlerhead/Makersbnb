feature 'Add new booking' do
  scenario 'user can add a new booking' do
    connection = PG.connect(dbname: 'makersbnb_test')
    visit ('/')
    find('button').click
    fill_in('date_pick', with: "2021-11-24")
    click_button
    expect(page).to have_content "2021-11-24"
  end
end

