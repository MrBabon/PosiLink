class ContactMailer < ApplicationMailer

  def contact_email(contact_form)
    @contact_form = contact_form
    mail(to: 'contact@dannacode.com', subject: 'Nouveau message provenant de PosiLink')
  end
end
