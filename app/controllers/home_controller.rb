class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def search
    @query = params[:q]
    render :text => @query
  end
end

