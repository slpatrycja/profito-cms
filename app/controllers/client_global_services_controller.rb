# frozen_string_literal: true

class ClientGlobalServicesController < ApplicationController
  before_action :provide_client, except: %i[destroy]
  before_action :provide_client_service, only: %i[destroy update_comments]

  def index
    @client_global_services = ClientGlobalService.joins(:client).where(client: @client).order(created_at: :desc)
  end

  def new
    @client_global_service = @client.client_global_services.new
    @available_services = GlobalService.all
    gon.available_services = @available_services
  end

  def create
    @client_service = ClientGlobalService.new(client_service_params)

    if @client_service.valid?
      @client_service.save!
      redirect_to client_client_global_services_path(@client.id)
    else
      @country = @client_service.country
      @available_services = ClientGlobalService.all
      render 'new'
    end
  end

  def destroy
    @client_service.destroy!

    redirect_to client_client_global_services_path(client_id: @client_service.client.id)
  end

  def update_comments
    @client_service.update!(comments: params.fetch(:comments))

    redirect_to client_client_global_services_path(@client.id)
  end

  private

  def provide_client
    @client = Client.find(params[:client_id])
  end

  def provide_client_service
    @client_service = ClientGlobalService.find(params[:id])
  end

  def client_service_params
    params.require(:client_global_service).permit(:client_id, :global_service_id, :price, :comments)
  end
end
