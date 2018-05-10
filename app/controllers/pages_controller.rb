class PagesController < ApplicationController
  # before_action :authenticate_user!, except: [:home, :contact]
  
  def home
    @tasks = Task.last(3)
  end

  def contact
  end

  def contact_email
    user_info = {user: current_user, name: email_params[:name], email1: email_params[:email1], message: email_params[:message]}
    ContactMailer.send_contact_email(user_info).deliver_now
    # render :contact
    redirect_to root_path
  end

  private
  def email_params
    params.require(:contact).permit(:name, :email1, :message)
  end

end
