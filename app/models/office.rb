# frozen_string_literal: true

class Office < ApplicationRecord
  belongs_to :country

  validates :name, :country, presence: true
end
