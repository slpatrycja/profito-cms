# frozen_string_literal: true

module Api
  module Clients
    class GlobalServicesController < ApplicationController
      def index
        client_services = ClientGlobalService.joins(:client)
                                             .where(client: client)
                                             .order(created_at: :desc)

        render json: ::ClientGlobalServiceRepresenter.for_collection.new(client_services)
      end

      def create
        client_service = ClientGlobalService.new(client_service_params)

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

      private

      def client_service
        @_client_service = ClientGlobalService.find(params[:id])
      end

      def client
        @_client ||= Client.find(params[:client_id])
      end

      def client_service_params
        params.require(:client_service).permit(:client_id, :service_id, :price, :comments)
      end
    end
  end
end
