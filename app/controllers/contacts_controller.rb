class ContactsController < ApplicationController
    def new
        @contact = Contact.new
        authorize @contact
      end
    
      def create
        @contact = Contact.new(contact_params)
        if @contact.valid?
          ActiveStorage::Current.url_options = Rails.application.config.active_storage.service
          ContactMailer.contact_email(@contact).deliver_now
          @contact.recto_id.attach(params[:contact][:recto_id])
          @contact.verso_id.attach(params[:contact][:verso_id])
          @contact.receipt.attach(params[:contact][:receipt])
          flash[:success] = "Votre message a été envoyé avec succès."
          redirect_to root_path
        else
          render :new
        end
        authorize @contact
      end
    
      private
    
      def contact_params
        params.require(:contact).permit(:first_name, :last_name, :email, :message, :recto_id, :verso_id, :receipt, :rna_number)
      end
end
