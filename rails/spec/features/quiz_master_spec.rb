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

RSpec.feature 'Update question', :type => :feature do
  before :each do
    @question = Question.create(:question => 'What is the meaning of life?', :answer => "42")
    @question.save
  end

  scenario 'user updates a question' do
    visit(edit_question_path(@question))

    fill_in 'Question', :with => 'Are you sure that is the meaning of life?'
    fill_in 'Answer', :with => 'Yes'

    click_button 'Update Question'

    expect(page).to have_content "Question saved successfully"
  end
end
