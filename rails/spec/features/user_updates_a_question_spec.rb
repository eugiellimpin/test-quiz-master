require 'rails_helper'

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
