require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the hair salon path', {:type => :feature}) do
  it('goes to index, lets user put in stylist') do
    visit('/')
    fill_in('Stylist name', :with => 'Peter')
    click_button("Add stylist")
    expect(page).to have_content('Peter')
  end
end
