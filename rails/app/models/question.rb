class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    formatted_answer = answer.squish.downcase
    formatted_submission = submission.squish.downcase
    number_to_string(formatted_answer) == number_to_string(formatted_submission)
  end

  private

  def number_to_string(string)
    string.match(/^-?\d+$/) ? string.to_i.humanize : string
  end

end
