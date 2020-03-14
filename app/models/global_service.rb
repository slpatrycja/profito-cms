# frozen_string_literal: true

class GlobalService < ApplicationRecord
  has_many :client_global_services, dependent: :destroy
  has_many :clients, through: :client_global_services

  validates :name, :price, presence: true
end
