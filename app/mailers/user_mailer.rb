class UserMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez Eventbrite') 
  end

  def new_participant(attendance)
    @attendance = attendance 
    @participant = Event.find(@attendance.event.id)
    @admin = User.find(@participant.admin.id)
    @url  = 'http://monsite.fr/login' 

    mail(to: @admin.email, subject: '+ 1 participant') 
  end

end
