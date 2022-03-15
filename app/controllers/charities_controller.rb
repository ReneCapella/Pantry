# app/controllers/travel_controller.rb
class CharitiesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def search
    charities = find_charities(params[:zipcode])
    puts charities
    unless charities
      flash[:alert] = 'Country not found'
      return render action: :index
    end
    # ...
  end

  private

  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        # 'X-RapidAPI-Host' => URI.parse(url).host,
        # 'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
      }
    )

    return nil if response.status != 200

    JSON.parse(response.body)
  end

  def find_charities(zipode)
    request_api(
      'http://api.fightpoverty.online/api/charity?q={"filters":[{"name":"name","op":"like","val":"%25food Bank%25"}, {"name":"city","op":"has","val":{"name":"name","op":"like","val":"%25i%25"}}],"order_by":[{"field":"fight_poverty_score","direction":"desc"}]}'
      # "https://restcountries-v1.p.rapidapi.com/name/#{URI.encode(name)}"
    )
  end
end
