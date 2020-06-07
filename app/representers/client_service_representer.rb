# frozen_string_literal: true

class ClientServiceRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :year
  property :status
  property :price
  property :comments

  property :created_at, exec_context: :decorator
  property :updated_at, exec_context: :decorator
  property :office_name, exec_context: :decorator
  property :service_name, exec_context: :decorator
  property :shipment_date, exec_context: :decorator

  def created_at
    represented.created_at.strftime('%F')
  end

  def updated_at
    represented.created_at.strftime('%F, %H:%M')
  end

  def office_name
    Office.find(represented.office_id).name
  end

  def service_name
    Service.find(represented.service_id).name
  end

  def shipment_date
    represented.shipment&.date
  end
end
