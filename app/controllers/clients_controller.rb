class ClientsController < ApplicationController
  def new
    @clients = Client.where(user: current_user)
    @client = Client.new
  end

  def create
    # merges the user_id into the client_params hash
    @client = Client.new(client_params.merge(user_id: current_user.id))
    if @client.save
      redirect_to clients_path
    else
      @clients = Client.where(user: current_user)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def client_params
    # assigning user to client
    # params[:client][:user] = current_user
    params.require(:client).permit(:email, :name, :phone, :address)
  end
end
