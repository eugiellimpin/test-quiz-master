require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "Get #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "load all of the questions into @questions" do
      question1 = Question.create(question: "Foo?", answer: "Bar")
      question2 = Question.create(question: "Bar?", answer: "Baz")

      get :index
      expect(assigns(:questions)).to match_array([question1, question2])
    end
  end

  describe "Get #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "creates a Question instance to use in the form" do
      get :new
      expect(assigns(:question)).to be_instance_of(Question)
    end
  end
end
