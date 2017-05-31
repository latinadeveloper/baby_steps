class SessionsController < ApplicationController
  def new  #sign in page
  end

  def create  # it does the sign in
    @user = User.find_by(name: params[:user][:name])
    if @user
      @verify = @user.authenticate(params[:user][:password])
    end
    if @verify
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, you've logged in."
      redirect_to root_path
      # redirect_to user_path(@user)
    else
      flash[:error] = "Wrong username or password."
      redirect_to signin_path
    end
  end

  def destroy  #destroys
    reset_session
    redirect_to root_path
  end
end
