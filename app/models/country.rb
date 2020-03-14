# frozen_string_literal: true

class Country < ApplicationRecord
  SHORT_NAMES_MAPPING = {
    Poland: 'PL',
    Germany: 'DE',
    Belgium: 'BE',
    Netherlands: 'NL',
    Austria: 'AT',
    France: 'FR'
  }.freeze.with_indifferent_access

  SKIPPABLE_COUNTRIES = ['Poland', 'Not set'].freeze

  has_many :offices, dependent: :destroy

  validates :name, presence: true

  scope :for_shipment, -> { where.not(name: SKIPPABLE_COUNTRIES) }
end
