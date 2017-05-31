class UsersController < ApplicationController

  def new
    @user = User.new
    @user.child = Child.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path
      else
        render "new"
      end

  end

  private
  def user_params
      params.require(:user).permit(
      :name,
      :password,
      :password_confirmation,
        child_attributes: [
        :child_name, :age
        ]
        )
    end
end
