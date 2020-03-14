# frozen_string_literal: true

class Client < ApplicationRecord
  MARITAL_STATUSES = {
    single: 'single',
    married: 'married',
    divorced: 'divorced',
    widower: 'widower',
    unknown: 'unknown'
  }.freeze

  enum marital_status: MARITAL_STATUSES, _prefix: :marital_status
  has_many :client_services, dependent: :destroy
  has_many :client_global_services, dependent: :destroy
  has_many :services, through: :client_services
  has_many :global_services, through: :client_global_services
  has_many :client_logs, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :name, :surname, :pesel, presence: true
  validates :country, :voivodeship, :postal_name, :postal_code, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true

  before_validation :check_wedding_date!

  scope :search, -> (query) {
    if query.present?
      where("name ILIKE :query OR surname ILIKE :query OR birth_date::text LIKE :query OR city ILIKE :query", { query: "%#{query}%" })
    else
      all
    end
  }

  scope :with_documents_ready_for_shipment, -> { joins(:client_services).where('client_services.status = ?', ClientService::STATUSES[:ready_for_shipment]) }

  def self.in_debt
    find_by_sql(
      "WITH cs_sums AS (
        SELECT client_id, SUM(price) as total_price
        FROM client_services
        GROUP BY client_id
     ), cgs_sums AS (
        SELECT client_id, SUM(price) as total_price
        FROM client_global_services
        GROUP BY client_id
     ), payments_sums AS (
        SELECT client_id, SUM(value) as total_payed
        FROM payments
        GROUP BY client_id
     )
      SELECT * FROM clients
        LEFT JOIN cgs_sums ON cgs_sums.client_id = clients.id
        LEFT JOIN cs_sums ON cs_sums.client_id = clients.id
        LEFT JOIN payments_sums on payments_sums.client_id = clients.id
        WHERE (COALESCE(cs_sums.total_price, 0) + COALESCE(cgs_sums.total_price, 0) > COALESCE(payments_sums.total_payed, 0))
        ORDER BY clients.surname"
    )
  end

  def check_wedding_date!
    self.wedding_date = nil unless marital_status == MARITAL_STATUSES[:married]
  end

  def full_name
    "#{name} #{surname}"
  end

  def in_debt?
    debt > 0
  end

  def debt
    @debt ||= client_services.sum(:price) + client_global_services.sum(:price) - payments.sum(:value)
  end
end
