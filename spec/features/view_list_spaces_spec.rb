feature 'list of spaces' do
  scenario 'user can view a list of spaces' do
    visit ('/')

    expect(page).to have_content ["Blossom Villa"]
  end
end

