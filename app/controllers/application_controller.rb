class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    if user.profile.nil?
      new_profile_path
    else
      root_path
    end
  end

end
