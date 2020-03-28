# frozen_string_literal: true

class StatisticsController < ApplicationController
  def actions; end

  def debtors
    @clients = Client.in_debt
    @total_debt = @clients.sum(&:debt)

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def daily; end
end
