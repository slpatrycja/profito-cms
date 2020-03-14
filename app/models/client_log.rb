# frozen_string_literal: true

class ClientLog < ApplicationRecord
  belongs_to :client

  validates :description, :author_id, presence: true

  def author
    User.find(author_id)
  end
end
