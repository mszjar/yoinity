class PotentialUserMailer < ApplicationMailer
  def welcome_email(potential_user)
    @potential_user = potential_user
    mail(to: @potential_user.email, subject: 'Welcome to Our Website')
  end
end
