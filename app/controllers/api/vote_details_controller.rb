class Api::VoteDetailsController < Api::ApiController
    
  def create

    #if ip address already exists, send back an error message
    
    @ip = request.remote_ip

    #if Question.find_by(id: vote_detail_params[:question_id]).vote_details.where(ip: @ip).exists?
    #  render json: {error: 'areadly voted'}
    #else

    @vote_detail = VoteDetail.new(vote_detail_params.merge(ip: @ip))

    
      if @vote_detail.save
       render status: 200, 
              json: 
                { test: "test",
                  vote_detail: @vote_detail,
                  questions: Question.all }
      else
        render json: @vote_detail.errors, status: :unprocessable_entity
      end
    
  end

  private
    def vote_detail_params
      params.permit(:question_id, :yes)
    end
end