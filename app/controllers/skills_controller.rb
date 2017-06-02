class SkillsController < ApplicationController
  def index
    @skills = Skill.all
    @child = Child.find_by(id: params[:child_id])


    @skills.each do |activity|
      @child.child_skills.new(skill: activity)
    end

  end
end
