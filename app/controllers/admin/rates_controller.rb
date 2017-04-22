class Admin::RatesController < ApplicationController

  def index
    @rates = Rate.all
  end

  def results
  	@rates = Rate.all
  	@users = User.all
  end
end
