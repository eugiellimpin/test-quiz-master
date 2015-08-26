require 'rails_helper'

RSpec.feature 'Quiz Master', :type => :feature do
  scenario 'User creates a new question' do
    visit '/questions/new'

    fill_in 'Question', :with => 'Who are you?'
    fill_in 'Answer', :with => 'Your worst nightmare'

    click_button 'Create Question'

    expect(page).to have_content 'Question created successfully'
  end

  scenario 'User leaves Question field blank' do
    visit '/questions/new'

    fill_in 'Answer', :with => 'Answer without a question'

    click_button 'Create Question'

    expect(page).to have_content "Question can't be blank"
  end

  scenario 'User leaves Answer field blank' do
    visit '/questions/new'

    fill_in 'Question', :with => 'What is the meaning of life?'

    click_button 'Create Question'

    expect(page).to have_content "Answer can't be blank"
  end
end
