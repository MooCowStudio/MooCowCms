class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.send_contact(@contact).deliver
        format.html { redirect_to action: :finish }
      else
        format.html { render :index }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.fetch(:contact, {}).permit(:name, :email, :body)
    end
end
