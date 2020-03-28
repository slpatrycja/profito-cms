# frozen_string_literal: true

module Api
  class ServicesController < ApplicationController
    def index
      render json: services
    end

    private

    def services
      @_services ||= Service.where(country: country, service_type: params[:service_type])
    end

    def country
      @_country ||= Country.find_by(name: params[:country_name])
    end
  end
end
