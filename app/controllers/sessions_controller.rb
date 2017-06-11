class SessionsController < ApplicationController
  def new  #sign in page
  end

  def create  # it does the sign in
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to home_path
    else
      @user = User.find_by(name: params[:user][:name])
      if @user
        @verify = @user.authenticate(params[:user][:password])
      end
      if @verify
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, you've logged in."
        redirect_to home_path
      else
        flash[:error] = "Wrong username or password."
        redirect_to signin_path
      end
    end
  end

  def destroy  #destroys
    reset_session
    redirect_to root_path
  end
end
