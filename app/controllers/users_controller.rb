class UsersController < ApplicationController
  def index
    query = params[:query]
    @users = User.all.order(:username)
    @users = User.search(query) if query

    respond_to do |format|
      format.html
      format.json { render json: {users: @users } }
    end
  end
end
