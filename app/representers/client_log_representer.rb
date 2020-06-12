# frozen_string_literal: true

class ClientLogRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :description

  property :created_at, exec_context: :decorator
  property :author, exec_context: :decorator

  def created_at
    represented.created_at.strftime('%F, %H:%M')
  end

  def author
    represented.author.display_initials
  end
end
