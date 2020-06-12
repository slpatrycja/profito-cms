# frozen_string_literal: true

class ClientGlobalServiceRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :price
  property :comments

  property :created_at, exec_context: :decorator
  property :updated_at, exec_context: :decorator
  property :service_name, exec_context: :decorator

  def created_at
    represented.created_at.strftime('%F')
  end

  def updated_at
    represented.created_at.strftime('%F, %H:%M')
  end

  def service_name
    Service.find(represented.service_id).name
  end
end
