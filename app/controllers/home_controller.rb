class HomeController < ApplicationController

  def index

    @sort = params[:sort]
    if @sort == "newest"
      @questions = Question.order_by(created_at: :desc)
    elsif @sort == "oldest"
      @questions = Question.order_by(created_at: :asc)
    elsif @sort == "vote_count"
      # will let you work on this one, it's tougher for sure!
      @questions = @question.sort! { |a,b| (b.vote_details.where(yes: true).count+b.vote_details.where(yes: false).count) <=> (a.vote_details.where(yes: true).count+a.vote_details.where(yes: false).count) }
    else
      @questions = Question.all
    end

    @ip = request.remote_ip

  end

  def help
  end

end




