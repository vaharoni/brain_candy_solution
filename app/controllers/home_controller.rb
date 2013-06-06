class HomeController < ApplicationController
  def index
    @brain_candies = BrainCandy.all
    @users = User.includes(:brain_candy_completions).all

    # Finding the current_user object with preloaded brain_candy_completions
    @current_user = @users.select{|u| u.id == current_user.id}.first
  end
end