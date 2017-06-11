class ChildrenController < ApplicationController
  before_action :set_child

  def index
    @children = Child.all
  end

  def new
    @child = Child.new
  end

  def show
    @skills = @child.skills
  end
    

  def update
    @child.update(child_params)
    redirect_to child_skills_path(@child)
  end

  private
  def child_params
    params.require(:child).permit(
      accomplishments_attributes: [
      :id,
      :skill_id,

      # :perform
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
