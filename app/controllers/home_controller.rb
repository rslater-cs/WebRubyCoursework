class HomeController < ApplicationController

  def request_contact
    #Save all info of the contact form
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    #if the user did not enter the email, do not create an issue and go back to form
    # if the user did enter the email, send an email to user support
    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
      redirect_to contact_path
      return
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end

    #if the name and message are not blank create and issue
    # if the name and message are blank, give a error message and redirect to form
    if !name.blank? && !message.blank?
      @issue = Issue.new(name: name, email: email, telephone: telephone, message: message, closed: false)

      #if the issue can be saved give a success message and redirect to posts
      if @issue.save
        flash[:notice] = t(".success")
        redirect_to posts_path
      end
    else
      flash[:alert] = t(".error_fields_missing")
      redirect_to contact_path
    end
  end

  def get_user
    #Save user info
    email = params[:user][:email]
    password = params[:user][:password]

    #if email or password are blank send a error message and redirect back to root
    if email.blank? || password.blank?
      flash[:alert] = t(".error_empty_fields")
      redirect_to root_path
    else
      #get user from database
      user = User.find_by("email = '#{email}' AND password = '#{password}'")
      #if user is not found send error and redirect to root
      # if user is found save user id to session variables and redirect to posts
      if user.nil?
        flash[:alert] = t(".error_no_user")
        redirect_to root_path
      else
        session[:user_id] = user[:id]
        redirect_to posts_path
      end
    end
  end
end
