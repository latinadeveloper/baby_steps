class SkillsController < ApplicationController
  def index
    @skills = Skill.all
    @child = Child.find_by(id: params[:child_id])


    @skills.each do |activity|
      unless @child.accomplishments.exists?(skill_id: activity.id)
        @child.accomplishments.new(skill: activity)
      end
    end

  end
end
