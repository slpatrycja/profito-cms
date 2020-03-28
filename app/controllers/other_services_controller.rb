# frozen_string_literal: true

class OtherServicesController < ApplicationController
  before_action :provide_client, except: %i[change_status destroy]
  before_action :provide_client_benefit, only: %i[destroy change_status update_comments]

  def index
    @services = ClientService.joins(:client)
                             .joins(:service)
                             .where(client: @client)
                             .where(services: { service_type: 'other' })
  end

  def new
    @client_benefit = @client.client_services.new
    provide_available_selects(@country)
    gon.available_services = @available_services
  end

  def create
    @client_benefit = ClientService.new(client_benefit_params)

    if @client_benefit.valid?
      @client_benefit.save!
      redirect_to client_benefits_path(client_id: @client, country_name: @client_benefit.country.name)
    else
      @country = @client_benefit.country
      provide_available_selects(@country)
      render 'new'
    end
  end

  def destroy
    @client_benefit.destroy!

    redirect_to client_benefits_path(client_id: @client_benefit.client_id, country_name: @client_benefit.country.name)
  end

  def change_status
    @client_benefit.update!(status: params.fetch(:status))
  end

  def update_comments
    @client_benefit.update!(comments: params.fetch(:comments))

    redirect_to client_benefits_path(client_id: @client, country_name: @client_benefit.country.name)
  end

  private

  def provide_client
    @client = Client.find(params[:client_id])
  end

  def provide_country
    @country = Country.find_by(name: params[:country_name])
  end

  def provide_client_benefit
    @client_benefit = ClientService.find(params[:client_service_id])
  end

  def provide_available_selects(country)
    @available_services = Service.where(country: country, service_type: 'benefit')
    @available_offices = Office.where(country: country)
  end

  def client_benefit_params
    params.require(:client_benefit).permit(:client_id, :service_id, :office_id, :year, :price, :comments)
  end
end
