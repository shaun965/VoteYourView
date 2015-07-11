class HomeController < ApplicationController

  def index
    
    @question = Question.all
    @question = @question.sort! { |a,b| (b.vote_details.where(yes: true).count+b.vote_details.where(yes: false).count) <=> (a.vote_details.where(yes: true).count+a.vote_details.where(yes: false).count) }
    binding.pry
    @ip = request.remote_ip
    # binding.pry 
  end

  def help
  end

end




