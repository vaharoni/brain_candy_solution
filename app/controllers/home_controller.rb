class HomeController < ApplicationController
  def index
    @brain_candies = BrainCandy.all
    @users = User.includes(:brain_candy_completions).all
  end
end