require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with a valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('activate your account')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with  'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

end