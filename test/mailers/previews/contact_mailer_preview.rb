# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact_email
    ContactMailer.contact_email("ryan.slater157@gmail.com", "Ryan Slater", "0123456789", @message="I have an issue")
  end
end
