require 'rails_helper'

RSpec.feature 'Update question', :type => :feature do
  before :each do
    @question = Question.create(:question => 'What is the meaning of life?', :answer => "42")
    @question.save
    visit(edit_question_path(@question))
  end

  scenario 'user updates a question' do
    fill_in 'Question', :with => 'Are you sure that is the meaning of life?'
    fill_in 'Answer', :with => 'Yes'
    click_button 'Update Question'

    expect(page).to have_content "Question saved successfully"
  end

  scenario 'user leaves Question field blank' do
    fill_in 'Question', :with => ''
    fill_in 'Answer', :with => 'Answer without a question'
    click_button 'Update Question'

    expect(page).to have_content "Question can't be blank"
  end

  scenario 'user leaves Answer field blank' do
    fill_in 'Question', :with => 'What is the meaning of life?'
    fill_in 'Answer', :with => ''
    click_button 'Update Question'

    expect(page).to have_content "Answer can't be blank"
  end
end
