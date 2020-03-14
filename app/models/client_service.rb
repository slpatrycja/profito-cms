# frozen_string_literal: true

class ClientService < ApplicationRecord
  DISPLAYED_STATUSES = {
    new: 'new',
    sent_to_client: 'sent_to_client',
    documents_received: 'documents_received',
    ready_for_shipment_with_lacks: 'ready_for_shipment_with_lacks',
    ready_for_shipment_copied: 'ready_for_shipment_copied',
    ready_for_shipment: 'ready_for_shipment'
  }.freeze

  STATUSES = DISPLAYED_STATUSES.merge({ sent: 'sent' }).freeze

  enum status: STATUSES, _prefix: :status

  belongs_to :client
  belongs_to :service
  belongs_to :office
  has_one :shipment, dependent: :destroy

  validates :price, :year, presence: true

  delegate :name, to: :service
  delegate :country, to: :service

  scope :ready_for_shipment, -> {
    where(status: [STATUSES[:ready_for_shipment], STATUSES[:ready_for_shipment_copied], STATUSES[:ready_for_shipment_with_lacks]])
  }

  def shipment_date
    shipment&.date
  end

  def status_name
    I18n.t("tax.statuses.#{status}")
  end
end
