require 'rails_helper'

RSpec.feature 'User answers a question', :type => :feature do
  before :each do
    @question = Question.create(:question => 'What is your favorite pet?', :answer => 'Sandals')
    @question.save
    visit(question_path(@question))
  end

  scenario 'correctly' do
    fill_in 'answer_answer', :with => 'sandals'
    click_button 'Submit answer'

    expect(page).to have_content 'The answer you provided is correct!'
    expect(page).to have_content "Answer: #{@question.answer}"
  end

  scenario 'incorrectly' do
    fill_in 'answer_answer', :with => 'Cat'
    click_button 'Submit answer'

    expect(page).to have_content 'The answer you provided is incorrect.'
    expect(page).to have_content "The correct answer is: #{@question.answer}"
  end
end
