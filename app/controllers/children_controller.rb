class ChildrenController < ApplicationController
  def update
    @child = Child.find_by(id: params[:id])
    @child.update(child_params)
  end


  private
  def child_params
    params.require(:child).permit(
      accomplishments_attributes: [
      # :skill_id,
      # :perform
      :comment
      ]
      )
  end
end