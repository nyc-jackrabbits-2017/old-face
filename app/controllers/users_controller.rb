class UsersController < ApplicationController
  def index
    query = params[:query]
    @users = User.all.order(:username)
    @users = User.search(query) if query
  end
end
