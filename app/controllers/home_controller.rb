class HomeController < ApplicationController
  def home
  end

  def contact
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end

    if !email.blank? && !telephone.blank? && !name.blank? && !message.blank?
      @issue = Issue.new(name: name, email: email, telephone: telephone, message: message, closed: false)
      if @issue.save
        flash[:alert] = "Issue was create successfully"
        redirect_to posts_path
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_user
    email = params[:user][:email]
    password = params[:user][:password]

    if email.blank? || password.blank?
      flash[:alert] = "Email and password must be filled in #{email} and #{password}"
      redirect_to root_path
    else
      user = User.find_by("email = '#{email}' AND password = '#{password}'")
      if user.nil?
        flash[:alert] = "User does not exist"
        redirect_to root_path
      else
        session[:user_id] = user[:id]
        redirect_to posts_path
      end
    end
  end
end
