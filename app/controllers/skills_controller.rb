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
end
