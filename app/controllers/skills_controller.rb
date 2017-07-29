class SkillsController < ApplicationController
  before_action :set_child

  def new
    @accomplishment = @child.accomplishments.find_or_initialize_by(skill_id: '1')
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
    if accomplishment = Accomplishment.find_by({ child_id: params[:child_id], skill_id: params[:accomplishment][:skill_id] })
      accomplishment.update(accomplishment_params)
      render json: accomplishment
    else
      accomplishment = @child.accomplishments.new(accomplishment_params)
      if accomplishment.save
        render json: accomplishment
      else
        render json: 'error - to do'
      end
    end
  end

  #showing one accomplistment at a time
  def show
    accomplishment = @child.accomplishments.find_or_initialize_by(skill_id: params[:id])
    render json: accomplishment
  end

  def current    
     render json: @child.skills    
  end

  # def recent
  #   @accomplishments = @child.accomplishments
  #   @recent_accomplishments = @accomplishments.recent_skills

  #   render json: @recent_accomplishments               
  # end

  def recent
    @accomplishments = @child.accomplishments
    @recent_accomplishments = @accomplishments.recent_skills

    respond_to do |format|
      format.html
      format.json {render json: @recent_accomplishments  }
    end
                 
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
