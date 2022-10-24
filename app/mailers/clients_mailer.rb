class ClientsMailer < ApplicationMailer
  def confirmation
    @client = params[:client]
    @user = params[:user]
    mail(from:'nowdelivery1234@gmail.com',to: @client.email, subject: 'Conta Criada com Sucesso!')
  end
end
