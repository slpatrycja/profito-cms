# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :provide_client

  def index
    @client_payments = Payment.where(client: @client).order(:created_at)
    @client_debts = client_services_debts + client_global_services_debts
    @total = payments_summary
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_create_params)

    if @payment.valid?
      @payment.save!
      redirect_to client_payments_path(@client)
    else
      render 'new'
    end
  end

  def destroy
    Payment.find(params[:id]).destroy!
    redirect_to client_payments_path(@client)
  end

  private

  def client_global_services_debts
    ClientGlobalService.joins(:client).joins(:global_service).where(client: @client).order(:created_at)
  end

  def client_services_debts
    ClientService.joins(:client).joins(:service).where(client: @client).order(:created_at)
  end

  def provide_client
    @client = params[:client_id] ? Client.find(params[:client_id]) : Client.find(params[:id])
  end

  def payment_create_params
    params.require(:payment).permit(:client_id, :value, :author_id)
  end

  def payments_summary
    payed = @client_payments.pluck(:value).sum(0)
    owns = @client_debts.pluck(:price).sum(0)

    payed - owns
  end
end
