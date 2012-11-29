class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def search
    @query = params[:q]
    @documents = PgSearch.multisearch(@query).limit(10).includes(:searchable)
    @results   = @documents.map { |d| d.searchable }
  end

  def error
    flash[:error] = "The page you are looking for is not here."
    redirect_to '/'
  end
end

