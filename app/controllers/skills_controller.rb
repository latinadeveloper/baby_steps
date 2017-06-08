class SkillsController < ApplicationController
  before_action :set_child

  def index
    @skills = Skill.all
    @skills.each do |activity|
      unless @child.accomplishments.exists?(skill_id: activity.id)
        @child.accomplishments.new(skill: activity)
      end
    end
  end

  private
  def set_child
    @child = Child.find_by(id: params[:child_id])
    if @child && @child.user != current_user
      redirect_to root_path
    end
  end
end
