class VoteDetailsController < ApplicationController
  before_action :set_vote_detail, only: [:show, :edit, :update, :destroy]


  # GET /vote_details
  # GET /vote_details.json
  def index
    @vote_details = VoteDetail.all
  end


  # GET /vote_details/1
  # GET /vote_details/1.json
  def show
  end

  # GET /vote_details/new
  def new
    @vote_detail = VoteDetail.new
  end

  # GET /vote_details/1/edit
  def edit
  end

  # POST /vote_details
  # POST /vote_details.json
  def create
    @vote_detail = VoteDetail.new(vote_detail_params)

    respond_to do |format|
      if @vote_detail.save
        format.html { redirect_to root_url, notice: 'Vote detail was successfully created.' }
        format.json { render :show, status: :created, location: @vote_detail }
      else
        format.html { render :new }
        format.json { render json: @vote_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_details/1
  # PATCH/PUT /vote_details/1.json
  def update
    respond_to do |format|
      if @vote_detail.update(vote_detail_params)
        format.html { redirect_to @vote_detail, notice: 'Vote detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote_detail }
      else
        format.html { render :edit }
        format.json { render json: @vote_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_details/1
  # DELETE /vote_details/1.json
  def destroy
    @vote_detail.destroy
    respond_to do |format|
      format.html { redirect_to vote_details_url, notice: 'Vote detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_detail
      @vote_detail = VoteDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_detail_params
      params.permit(:question_id, :yes)
    end
end
