class SniimMailer < ActionMailer::Base
  default from: "abraham@bitbang.com.mx"


  def sniim_mailer(recipient)

  	recipient.mail

    # @listing = listing
    mail(:to => recipient.mail, :subject => "Agroden como herramienta para " + recipient.name)
  end


end
