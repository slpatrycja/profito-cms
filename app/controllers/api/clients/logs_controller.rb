# frozen_string_literal: true

module Api
  module Clients
    class LogsController < ApplicationController
      def index
        client_logs = ClientLog.where(client: client).order(:created_at)

        render json: ::ClientLogRepresenter.for_collection.new(client_logs)
      end

      def create
        client_log = ClientLog.new(client_log_create_params)

        if client_log.save
          head :ok
        else
          render json: { errors: client_log.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        ClientLog.find(params[:id]).destroy!

        head :ok
      end

      private

      def client
        @_client ||= Client.find(params[:client_id])
      end

      def client_log_create_params
        params.require(:client_log).permit(:client_id, :description, :author_id)
      end
    end
  end
end
