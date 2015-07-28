class Api::QuestionsController < Api::ApiController
    
  def index

    render json: { questions: Question.all }
  end

  def show

    question = Question.where(id: params[:id]).first

    if question

      render status: 200, json: { questions: question }
    else

      render status: 404, json: { error: "question not found for that id" }
    end

  end


end