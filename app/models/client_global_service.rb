# frozen_string_literal: true

class ClientGlobalService < ApplicationRecord
  belongs_to :client
  belongs_to :global_service

  validates :price, presence: true

  delegate :name, to: :global_service
end
