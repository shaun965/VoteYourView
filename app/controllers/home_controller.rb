class HomeController < ApplicationController

  def index

    @sort = params[:sort]
    if @sort == "newest"
      @questions = Question.order_by(created_at: :desc)
    elsif @sort == "oldest"
      @questions = Question.order_by(created_at: :asc)
    elsif @sort == "vote_count"
      # will let you work on this one, it's tougher for sure!
      @questions = Question.all
      #@questions = @questions.sort! { |a,b| (b.vote_details.where(yes: true).count+b.vote_details.where(yes: false).count) <=> (a.vote_details.where(yes: true).count+a.vote_details.where(yes: false).count) }

       # = []
      @questions = (@questions = @questions.each do |q|
        q.vote_count = q.vote_details.count
        q.save
      end).sort_by{ |a| a.vote_count }.reverse
      

      #@questions = @questions.sort_by{ |a| a.vote_count }.reverse

      #@questions = @questions.sort! { |a,b| (b.vote_details.count) <=> (a.vote_details.count) }

    else
      @questions = Question.all.page params[:page]
    end

    @ip = request.remote_ip

  end

  def help
  end

end




