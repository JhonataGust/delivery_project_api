# Preview all emails at http://localhost:3000/rails/mailers/clients_mailer
class ClientsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/clients_mailer/confirmation
  def confirmation
    ClientsMailer.confirmation
  end

end
