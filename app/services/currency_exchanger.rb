Dotenv.load

class CurrencyExchanger
  def initialize(params)
    @current_currency = params[:current_currency]
    @convert_to_currency = params[:convert_to_currency]
    @amount = params[:amount]
    @date = params[:date]
  end

  def convert_to_currency
    currency_rate = find_currency_rate
    if currency_rate == @error
      @error
    else
      converted_currency = (currency_rate * @amount.to_f).round(2)
      "You will got #{converted_currency}" + " #{@convert_to_currency}"
    end
  end
  
  private

  def find_currency_rate
    begin
      response =  RestClient.get(request_url, headers)
      info = JSON.parse(response, symbolize_names: true)
      if @date.empty?
          info[:result]
      else
          info[:rates][@convert_to_currency.to_sym]
      end
    rescue RestClient::Exception => e
      @error = "ERROR! (Code #{e})"
    end
  end
  
  def headers
    {content_type: :json, accept: :json, "apikey": ENV["API_KEY"]}
  end
  
  def request_url
    if @date.empty?
      "https://api.apilayer.com/fixer/convert?to=#{@convert_to_currency}&from=#{@current_currency}&amount=1"
    else
      "https://api.apilayer.com/fixer/#{@date}?symbols=#{@convert_to_currency}&base=#{@current_currency}"
    end
  end
end
