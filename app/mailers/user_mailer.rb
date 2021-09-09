class UserMailer < ApplicationMailer
  default from: 'ImmoCoin.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def password_reset(user)
    @user = user

    @url  = 'http://localhost:3000/reset_password'

    mail(to: @user.email, subject: "Password Reset")
  end
end
