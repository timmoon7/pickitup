class PagesController < ApplicationController
  # before_action :authenticate_user!, except: [:home, :contact]
  
  def home
    @tasks = Task.order('id DESC').first(3)
  end

  def contact
  end

  def contact_email
    user_info = {user: current_user, name: email_params[:name], email: email_params[:email], message: email_params[:message]}
    ContactMailer.send_contact_email(user_info).deliver_now
    # render :contact
    redirect_to root_path
  end

  private
  def email_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
