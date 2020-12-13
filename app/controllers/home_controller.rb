class HomeController < ApplicationController

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
      redirect_to contact_path
      return
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end

    if !name.blank? && !message.blank?
      @issue = Issue.new(name: name, email: email, telephone: telephone, message: message, closed: false)
      if @issue.save
        flash[:notice] = t(".success")
        redirect_to posts_path
      end
    else
      flash[:alert] = t(".error_fields_missing")
      redirect_to :new
    end
  end

  def get_user
    email = params[:user][:email]
    password = params[:user][:password]

    if email.blank? || password.blank?
      flash[:alert] = t(".error_empty_fields")
      redirect_to root_path
    else
      user = User.find_by("email = '#{email}' AND password = '#{password}'")
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
