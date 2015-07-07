class HomeController < ApplicationController

  def index
    @question = Question.all
    @ip = request.remote_ip
  end

  def help
  end

end




