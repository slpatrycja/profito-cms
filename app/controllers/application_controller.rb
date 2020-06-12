# frozen_string_literal: true

class ApplicationController < ActionController::Base
  PRIVATE_IPS = [
    IPAddr.new('10.0.0.0/8'),
    IPAddr.new('172.16.0.0/12'),
    IPAddr.new('192.168.0.0/16')
  ].freeze

  # before_action :block_foreign_hosts
  before_action :authorize_user!

  skip_before_action :verify_authenticity_token

  private

  def block_foreign_hosts
    return if private_ip?(request.remote_ip)

    respond_to do |format|
      format.html do
        render '/403', status: :forbidden, layout: false
      end
      format.json do
        self.status = :unauthorized
        self.response_body = { error: 'Access denied' }.to_json
      end
    end
  end

  def private_ip?(ip_address)
    ip_address = IPAddr.new(ip_address) if ip_address.is_a?(String)

    PRIVATE_IPS.any? { |private_ip| private_ip.include?(ip_address) }
  end

  def authorize_user!
    return if devise_controller?
    return if current_user

    redirect_to new_user_session_path, alert: 'Musisz być zalogowany.'
  end
end
