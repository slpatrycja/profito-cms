# frozen_string_literal: true

class PaymentRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :value

  property :created_at, exec_context: :decorator
  property :author, exec_context: :decorator

  def created_at
    represented.created_at.strftime('%F, %H:%M')
  end

  def author
    represented.author.initials
  end
end
