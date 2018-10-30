class OxfordService

  def get_sentences(word)
    get_json("/entries/en/#{word.downcase}/sentences")
  end

  private

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1") do |faraday|
      faraday.headers["app_id"] = ENV["OXFORD_APP_ID"]
      faraday.headers["app_key"] = ENV["OXFORD_API_KEY"]
      faraday.headers["Content-Type"] = "application/json"
      faraday.headers["Accept"] = "application/json"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    binding.pry
    result = JSON.parse(conn.get(url).body, symbolize_names: true)
  end

end
