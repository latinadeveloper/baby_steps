class UsersController < ApplicationController

  def new
    @user = User.new
    @user.children << Child.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome,#{@user.name} you've logged in."
        redirect_to home_path
      else
        render 'new'
      end
  end

  private
  def user_params
      params.require(:user).permit(
      :name,
      :password,
      :password_confirmation,
        child_attributes: [
        :child_name,
        :age
        ]
        )
    end
end
