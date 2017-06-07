class ChildrenController < ApplicationController
  def update
    @child = Child.find_by(id: params[:id])
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
