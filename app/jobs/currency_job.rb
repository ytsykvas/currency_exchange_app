class CurrencyJob
  include Sidekiq::Worker

  def perform
    find_rate = find_currency_rate
    if find_rate != @error
      ExchangeRate.create(:rate => find_rate)
    end
  end

  def find_currency_rate
    begin
    response =  RestClient.get(request_url, headers)
    info = JSON.parse(response, symbolize_names: true)
    info = info[:result].round(2)
    rescue RestClient::Exception => e
      puts "ERROR! (Code #{e})"
    end
  end

  private

  def headers
    {content_type: :json, accept: :json, "apikey": ENV["API_KEY"]}
  end
  
  def request_url
    "https://api.apilayer.com/fixer/convert?to=UAH&from=USD&amount=1"
  end
end

