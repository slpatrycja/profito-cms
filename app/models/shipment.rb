# frozen_string_literal: true

class Shipment < ApplicationRecord
  belongs_to :client_service

  validates :date, :author_id, presence: true
end
