# frozen_string_literal: true

class Service < ApplicationRecord
  TYPES = {
    tax: 'tax',
    benefit: 'benefit'
  }.freeze

  enum service_type: TYPES, _prefix: :service_type
  belongs_to :country

  has_many :client_services, dependent: :destroy
  has_many :clients, through: :client_services

  validates :name, :price, presence: true
end
