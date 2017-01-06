class UsersController < ApplicationController
  def index
    query = params[:query]
    @users = User.all
    @users = User.search(query) if query
  end
end
