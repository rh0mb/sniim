class SniimMailer < ActionMailer::Base
  default from: "abraham@bitbang.com.mx"


  def sniim_mailer(recipient)

  	@recipient = recipient

    # @listing = listing
    mail(:to => recipient.mail, :subject => "Agroden como herramienta para " + recipient.name) do |format|
    	format.html
    	format.text
		end
  end


end
