module ApplicationHelper
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

  def home_path
    # child_skills_path(current_user.child)
    root_path
  end

end
