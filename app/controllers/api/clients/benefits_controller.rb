# frozen_string_literal: true

module Api
  module Clients
    class BenefitsController < ClientServicesController
      private

      def service_type
        'benefit'
      end
    end
  end
end
