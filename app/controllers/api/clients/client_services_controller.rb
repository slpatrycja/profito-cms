# frozen_string_literal: true

module Api
  module Clients
    class ClientServicesController < ApplicationController
      def index
        client_services = ClientService.joins(:client)
                                       .joins(:service)
                                       .where(client: client)
                                       .where(services: { country: country, service_type: params[:service_type] })
                                       .order(created_at: :desc)

        render json: client_services
      end

      def create
        client_service = ClientService.new(client_service_params)

        if client_service.save
          head :ok
        else
          render json: { errors: client_service.errors }, status: :unprocessable_entity
        end
      end


      def update
        client_service.assign_attributes(client_service_params)

        if client_service.save
          head :ok
        else
          render json: { errors: client_service.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        client_service.destroy!

        head :ok
      end

      def change_status
        client_service.update!(status: params.fetch(:status))

        head :ok
      end

      def update_comments
        client_service.update!(comments: params.fetch(:comments))

        head :ok
      end

      def send
        Shipment.create!(client_service: client_service, author_id: current_user.id, date: shipment_date)
        client_service.update!(status: 'sent')

        head :ok
      end

      private

      def client_service
        @_client_service = ClientService.find(params[:id])
      end

      def client
        @_client ||= Client.find(params[:client_id])
      end

      def country
        @_country ||= Country.find_by(name: params[:country_name])
      end

      def client_service_params
        params.require(:client_service).permit(:client_id, :service_id, :office_id, :year, :price, :comments)
      end

      def shipment_date
        MassShipmentForm.new(params.require(:shipment).permit(:date)).date
      end

      def service_type
        raise NotImplementedError
      end

      def redirect_to_index_path(_client_id)
        raise NotImplementedError
      end
    end
  end
end
