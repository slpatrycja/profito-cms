# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :client

  validates :value, :author_id, presence: true

  def author
    User.find(author_id)
  end
end
