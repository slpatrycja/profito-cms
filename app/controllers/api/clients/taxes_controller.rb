# frozen_string_literal: true

module Api
  module Clients
    class TaxesController < ClientServicesController
      private

      def service_type
        'tax'
      end
    end
  end
end
