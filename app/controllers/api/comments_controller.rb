class Api::CommentsController < Api::ApiController

def create
  @comment = Comment.new(comment_params)
  if @comment.save
    render json: { comments: @comment }
  end
  
end


private

  def comment_params
    params.require(:comment).permit(:text, :question_id, :user_id)
  end

end

