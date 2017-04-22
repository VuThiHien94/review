class StaticPagesController < ApplicationController
  def home
    #@questions = Question.all
    @start = Question.find(1);
  end

  def thanks
  end
end
