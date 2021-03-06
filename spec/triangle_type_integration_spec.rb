require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the triangle path', {:type => :feature}) do
  it('processes the user entry and returns whether it is a triangle or not') do
    visit('/')
    fill_in('side1', :with => '2')
    fill_in('side2', :with => '2')
    fill_in('side3', :with => '8')
    click_button('Check')
    expect(page).to have_content('This is NOT a triangle.')
  end

  it('processes the user entry and returns whether it is an isosceles triangle or not') do
    visit('/')
    fill_in('side1', :with => '2')
    fill_in('side2', :with => '2')
    fill_in('side3', :with => '3')
    click_button('Check')
    expect(page).to have_content('This is an isosceles triangle.')
  end

  it('processes the user entry and returns whether it is an equilateral triangle or not') do
    visit('/')
    fill_in('side1', :with => '2')
    fill_in('side2', :with => '2')
    fill_in('side3', :with => '2')
    click_button('Check')
    expect(page).to have_content('This is an equilateral triangle.')
  end

  it('processes the user entry and returns whether it is a scalene triangle or not') do
    visit('/')
    fill_in('side1', :with => '2')
    fill_in('side2', :with => '3')
    fill_in('side3', :with => '4')
    click_button('Check')
    expect(page).to have_content('This is a scalene triangle.')
  end
end
