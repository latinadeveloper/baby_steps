class SkillsController < ApplicationController
  before_action :set_child

  def new
    @accomplishment = Accomplishment.new
  end

  def index
    @skills = Skill.all
    @skills.each do |activity|
      unless @child.accomplishments.exists?(skill_id: activity.id)
        @child.accomplishments.new(skill: activity)
      end
    end
  end

  def create #adding a new accomplishment
    if @accomplishment = Accomplishment.find_by({ child_id: params[:child_id], skill_id: params[:accomplishment][:skill_id] })
      @accomplishment.update(accomplishment_params)
      redirect_to child_skills_path(@child)
    else
      @accomplishment = @child.accomplishments.new(accomplishment_params)
      if @accomplishment.save
        redirect_to child_skills_path(@child)
      else
        render 'new'
      end
    end
  end

  def current    
     render json: @child.skills    
  end

  def recent
    @accomplishments = @child.accomplishments
    @top_skills = @accomplishments.recent_skills
  end

  private
  def set_child
    @child = Child.find_by(id: params[:child_id])
    if @child && @child.user != current_user
      redirect_to root_path
    end
  end

  def accomplishment_params
    params.require(:accomplishment).permit(:skill_id, :comment, :perform)#attribute was not permitted
  end
end
