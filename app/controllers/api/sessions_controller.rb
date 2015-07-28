class Api::SessionsController < Api::ApiController

  def create

    binding.pry
    resource = warden.authenticate!(params)
    #@sessions = Sessions.new()



  end


  private

    def vote_detail_params
      params.permit(:email, :password)
    end

end