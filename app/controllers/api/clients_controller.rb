# frozen_string_literal: true

module Api
  class ClientsController < ApplicationController
    def index
      clients = Client.order(created_at: :desc).order(:surname)

      render json: clients
    end

    def show
      render json: client
    end

    def create
      client = Client.new(client_params)

      if client.valid?
        client.surname.strip!
        client.name.strip!
        client.save!

        head :ok
      else
        render json: { errors: client.errors }, status: :unprocessable_entity
      end
    end

    def update
      if client.update_attributes(client_params)
        head :ok
      else
        render json: { errors: client.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      client.destroy!
      head :ok
    end

    private

    def client
      @_client ||= Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :surname, :email, :pesel, :birth_date,
                                     :telephone, :country, :voivodeship, :postal_name,
                                     :postal_code, :city, :street, :house_number, :idnr_de,
                                     :idnr_nl, :idnr_be, :idnr_at, :steuernummer,
                                     :marital_status, :wedding_date, :problematic, :comment)
    end
  end
end
