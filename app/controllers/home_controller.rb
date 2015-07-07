class HomeController < ApplicationController

  def index
    @question = Question.all
    @ip = request.remote_ip
    puts "#{@ip} **************************************************"

  end

  def help
  end

end




