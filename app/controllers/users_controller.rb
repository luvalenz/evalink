class UsersController < ApplicationController
  def index
    @query = params[:q]
    @users = User.all
    @found = 0
  end



  def new
    redirect_to current_user if current_user
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to log_in_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @abilities = @user.abilities
    @expertises = @user.expertises
  end
end
