# frozen_string_literal: true

module Api
  class OfficesController < ApplicationController
    def index
      render json: offices
    end

    private

    def offices
      @_offices ||= Office.where(country: country)
    end

    def country
      @_country ||= Country.find_by(code: params[:country])
    end
  end
end
