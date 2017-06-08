class ChildrenController < ApplicationController
  before_action :set_child

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
end
