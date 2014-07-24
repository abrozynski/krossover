require 'spec_helper'

describe 'user registration' do
  it 'allows new users to register' do
    visit '/users/sign_up'

    fill_in 'First Name', :with => 'John'
    fill_in 'Last Name', :with => 'Doe'
    fill_in 'Email', :with => 'someone@example.com'
    fill_in 'School Name', :with => 'Startup Institute'
    fill_in 'Sport', :with => 'Basketball'
    fill_in 'Password', :with => 'aaaaaaaa'
    fill_in 'Confirm Password', :with => 'aaaaaaaa'

    click_button 'Sign up'

    page.should have_content('Welcome!')
  end
end
