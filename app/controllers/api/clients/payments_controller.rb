# frozen_string_literal: true

module Api
  module Clients
    class PaymentsController < ApplicationController
      def index
        render json: {
          payments: ::PaymentRepresenter.for_collection.new(payments),
          debts: ::DebtRepresenter.for_collection.new(debts),
          total: payments_summary
        }
      end

      def create
        payment = Payment.new(payment_create_params)

        if payment.save
          head :ok
        else
          render json: { errors: payment.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        Payment.find(params[:id]).destroy!

        head :ok
      end

      private

      def client
        @_client ||= Client.find(params[:client_id])
      end

      def payments
        @_payments ||= Payment.where(client: client).order(:created_at)
      end

      def debts
        @_debts ||= client_global_services_debts + client_services_debts
      end

      def client_global_services_debts
        @_client_global_services_debts ||= ClientGlobalService.joins(:client).joins(:global_service).where(client: client).order(:created_at)
      end

      def client_services_debts
        @_client_services_debts ||= ClientService.joins(:client).joins(:service).where(client: client).order(:created_at)
      end

      def payments_summary
        payed = payments.pluck(:value).sum(0)
        debt = debts.pluck(:price).sum(0)

        payed - debt
      end

      def payment_create_params
        params.require(:payment).permit(:client_id, :value).merge(author_id: current_user.id)
      end
    end
  end
end
