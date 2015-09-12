class Api::SessionsController < Api::ApiController

  def create

    user = User.find_by(email: params[:email])
    if user.valid_password?(params[:password])
      render json: { authentication_token: user.authentication_token }
    else
      render status: 404, json: { error: "question not found for that id" }
    end

    

    #@sessions = Sessions.new(
  end

  def destroy
    user = User.find_by(email: params[:email])
    user.authentication_token = Devise.friendly_token
    if user.save
      render json: { text: "You have successfully signed out" }
    else
      render status: 404, json: {error: "Could not sign out successfully. Please try again."}
    end

  end


  private

    def vote_detail_params
      params.permit(:email, :password)
    end

end