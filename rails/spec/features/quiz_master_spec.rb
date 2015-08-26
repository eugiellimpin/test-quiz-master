require 'rails_helper'

RSpec.feature 'Quiz Master', :type => :feature do
  scenario 'User creates a new question' do
    visit '/questions/new'

    fill_in 'Question', :with => 'Who are you?'
    fill_in 'Answer', :with => 'Your worst nightmare'

    click_button 'Create Question'

    expect(page).to have_content 'Question created successfully'
  end
end
