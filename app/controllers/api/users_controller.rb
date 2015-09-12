class Api::UsersController < Api::ApiController

  def create

    if user_params[:password] != user_params[:password_confirmation]
      render status: 404, json: {error: "Password and password confirmation do not match"}
      return
    end
    
    user = User.create(email: params[:email], password: params[:password])
    render json: {message: "Congradulation, you have successfully registered!"}

  end


  private
  
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
