class Api::QuestionsController < Api::ApiController


  acts_as_token_authentication_handler_for User
    
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

  def create

    binding.pry
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      render status: 200, json: { message: "Congradulation, you made a question" }
    else
      render status: 404, json: { error: "Could not create the question" }
    end
  end

  private
  
  def question_params
    params.require(:question).permit(:text, :category)
  end

end