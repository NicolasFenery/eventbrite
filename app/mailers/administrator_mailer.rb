class AdministratorMailer < ApplicationMailer
  default from: 'from@example.com'
 
  def new_participant_email(administrator)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @administrator = administrator

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attendance.event.administrator.email, subject: "Un nouveau participant vient de s'inscrire !") 
  end
end