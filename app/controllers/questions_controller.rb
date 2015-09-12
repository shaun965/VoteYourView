class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_filter :admin?, only: [:index, :edit, :update, :destroy]
  include QuestionsHelper

  

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    #@question = Question_id: 
    @ip = request.remote_ip
    @question = Question.find_by(id: params[:id])
    @comment = Comment.new
    @comments = Comment.all.where(question_id: params[:id])


    if current_user == User.find_by(id: @question.user_id)
      @question.vote_count_last_seen = @question.vote_details.count
      @question.save
    end

  end

  # GET /questions/new
  def new
    @question = Question.new
    @category = Category.all
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id


    #Very inefficient
    @question.category_id = Category.find_by(category: question_params[:category]).id
    #@question.category_name = question_params[:category]
    #binding.pry
    #@question.category_id = question_params[:category]

    respond_to do |format|
      if @question.save

        if Rails.env.production?
          client = twitter
          client.bearer_token
          client.update("#{@question.text} go vote now at #{request.host}/questions/#{@question.id}")
        end
        #binding.pry

        #if Rails.env.production?
        #end
        format.html { redirect_to root_url, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :category)
    end

end
