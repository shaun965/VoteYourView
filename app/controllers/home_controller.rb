class HomeController < ApplicationController

  def index
    @question = Question.all
    @ip = request.remote_ip
    # binding.pry 
  end

  def help
  end

end




