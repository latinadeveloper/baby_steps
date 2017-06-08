class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception


  protected
  def set_child
    @child = Child.find_by(id: params[:child_id])
    if @child && @child.user != current_user
      redirect_to root_path
    end
  end

end
