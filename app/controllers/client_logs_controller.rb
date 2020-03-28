# frozen_string_literal: true

class ClientLogsController < ApplicationController
  before_action :provide_client

  def index
    @client_logs = ClientLog.where(client: @client).order(:created_at)
  end

  def new
    @client_log = ClientLog.new
  end

  def create
    @client_log = ClientLog.new(client_log_create_params)

    if @client_log.valid?
      @client_log.save!
      redirect_to client_client_logs_path(@client)
    else
      render 'new'
    end
  end

  def destroy
    @client_log = ClientLog.find(params[:id])
    @client_log.destroy!

    redirect_to client_client_logs_path(@client)
  end

  private

  def provide_client
    @client = params[:client_id] ? Client.find(params[:client_id]) : Client.find(params[:id])
  end

  def client_log_create_params
    params.require(:client_log).permit(:client_id, :description, :author_id)
  end
end
