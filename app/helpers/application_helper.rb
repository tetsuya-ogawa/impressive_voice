module ApplicationHelper

  def current_user_admin?
    if current_user.admin
      true
    else
      false
    end
  end

end
