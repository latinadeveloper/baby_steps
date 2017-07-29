class ChildrenController < ApplicationController
  before_action :set_child, only: [:edit, :update, :delete, :show, :destroy ]###

  def index
    @children = current_user.children
    @child = Child.new
  end

  # def new
  #   @child = Child.new
  # end

  def show
    @skills = @child.skills
  end

  def create
    @child = current_user.children.new(child_params)
    @child.save
    render json: @child  
  end

  def update
    @child.update(child_params)
    redirect_to child_skills_path(@child)
  end

  def destroy
    @child.destroy
     redirect_to children_path, notice: 'Child was deleted.'
  end

  private
  def child_params
    params.require(:child).permit(
      :child_name,
      :age,
      accomplishments_attributes: [
      :id,
      :skill_id,
      :perform,
      :comment
      ]
      )
  end

  def set_child
    @child = Child.find_by(id: params[:id])
    if @child && @child.user != current_user
      redirect_to root_path
    end
  end
end
