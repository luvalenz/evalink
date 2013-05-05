class UsersController < ApplicationController
  def new
    redirect_to current_user if current_user
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.cpp = rand(10)
    @user.c = rand(10)
    @user.ruby = rand(10)
    @user.php = rand(10)
    @user.python = rand(10)

    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @job = Job.find(@user.job_id)
  end
end
