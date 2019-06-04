class ContactMailer < ApplicationMailer
# default to: current_user.email

    def send_contact_email(user_info)
        email = ENV.fetch('SYSTEM_EMAIL')
        @user = user_info[:user]   #current user object
        @name = user_info[:name]
        @email = user_info[:email]
        @message = user_info[:message]    
        date = Time.now.strftime("%A, %d/%B/%Y")
        subject = "New user message #{date}"
        # mail(to: @user.email, subject: subject)
        mail(to: email, subject: subject)        
    end

end
