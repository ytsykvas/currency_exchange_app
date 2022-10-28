class CurrencyConversionController < ApplicationController
  def index
  end

  def exchange
    obj = CurrencyExchanger.new(params)
    @result = obj.convert_to_currency
  end
end

