require 'httparty'
require 'json'

class Postcodesio
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes_array)
    JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def get_status(postcode)
    postcode["status"]
  end

  def get_result(postcode)
    postcode["result"]
  end

end

# new_postcodes = Postcodesio.new
# p new_postcodes.get_single_postcode("HA80PX")["status"]
# p new_postcodes.get_status
