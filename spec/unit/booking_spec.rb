require './app'
require 'setup_test_database'
require './lib/booking'

describe 'Booking' do
  it 'Can add a new booking' do
    setup_test_database
    Booking.add(space_id: "1", booked_date: "2021-12-12", resident: "20", requested: "1", confirmed: "0" )

    p '+++++++++'
    p Booking.all
    p '+++++++++'
    expect(Booking.all.first.booked_date).to include "2021-12-12"
  end

end
