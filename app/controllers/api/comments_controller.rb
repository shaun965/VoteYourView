class Api::CommentsController < Api::ApiController

    
    acts_as_token_authentication_handler_for User


def create

  #if User.find_by(email: params[:user_email]).authentication_token == params[:user_token]
    @comment = Comment.new(params)
    if @comment.save
      render json: { comments: @comment }
    end
  #else
  #  render json: { error: "Could not authenticate your information on the server"}
  #end
  
end


private

  def comment_params
    params.require(:comment).permit(:text, :question_id, :user_id)
  end

end

