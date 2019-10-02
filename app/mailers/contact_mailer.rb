class ContactMailer < ApplicationMailer
  default from: 'moocow-furaberl@moocow-st.com'
  default to: 'info@moocow-st.com'

  def send_contact(contact)
    @contact = contact
    mail(
      subject: "お問い合わせが届きました。",
    ) do |format|
      format.text
    end
  end
end
