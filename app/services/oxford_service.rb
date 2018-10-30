class OxfordService

  def get_sentences(word)
    get_json("api/v1/entries/en/#{word.downcase}/sentences")
  end

  private

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com/") do |faraday|
      faraday.headers["app_id"] = ENV["OXFORD_APP_ID"]
      faraday.headers["app_key"] = ENV["OXFORD_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    result = JSON.parse(conn.get(url).body, symbolize_names: true)
    binding.pry
  end

end
