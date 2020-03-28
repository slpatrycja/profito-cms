# frozen_string_literal: true

class MassShipmentsController < ApplicationController
  def new
    @offices = Office.where(country: country)
    @client_services = client_services
    @form = MassShipmentForm.new

    gon.clientServices = @client_services
  end

  def create
    @form = MassShipmentForm.new(mass_shipment_form_params)
    @form.client_service_ids.reject(&:empty?).each do |id|
      client_service = ClientService.find(id)
      Shipment.create(client_service: client_service, author_id: current_user.id, date: @form.date)
      client_service.update!(status: 'sent')
    end

    redirect_to mass_shipments_path
  end

  def country_choice; end

  private

  def country
    @country ||= Country.find(params[:country_id])
  end

  def client_services
    @client_services ||= ClientService.ready_for_shipment
                                      .joins(:client)
                                      .order('clients.surname')
                                      .map { |service| service_with_extended_name(service) }
  end

  def service_with_extended_name(service)
    OpenStruct.new(
      { name: "#{service.client.surname} #{service.client.name}, #{service.name}, #{service.year}, #{service.status_name}",
        id: service.id,
        office_id: service.office_id }
    )
  end

  def mass_shipment_form_params
    params.require(:mass_shipment_form).permit(:office_id, :date, client_service_ids: [])
  end
end
