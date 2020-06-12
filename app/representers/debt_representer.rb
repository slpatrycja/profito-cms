# frozen_string_literal: true

class DebtRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :price

  property :service_name, exec_context: :decorator

  def service_name
    Service.find(represented.service_id).name
  end
end
