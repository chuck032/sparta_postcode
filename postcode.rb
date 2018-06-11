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

  def get_postcode_length(postcode)
    get_result(postcode)["postcode"].length
  end

  def get_quality(postcode)
    get_result(postcode)["quality"]
  end

  def get_eastings(postcode)
    get_result(postcode)["eastings"]
  end

  def get_country(postcode)
    get_result(postcode)["country"]
  end

  def get_NHS(postcode)
    get_result(postcode)["nhs_ha"]
  end

  def get_longitude(postcode)
    get_result(postcode)["longitude"]
  end

  def get_latitude(postcode)
    get_result(postcode)["latitude"]
  end

  def get_parliamentary(postcode)
    get_result(postcode)["parliamentary_constituency"]
  end

  def get_european(postcode)
    get_result(postcode)["european_electoral_region"]
  end

  def get_primary_care(postcode)
    get_result(postcode)["primary_care_trust"]
  end

  def get_region(postcode)
    get_result(postcode)["region"]
  end

  def get_parish(postcode)
    get_result(postcode)["parish"]
  end

  def get_lsoa(postcode)
    get_result(postcode)["lsoa"]
  end

  def get_msoa(postcode)
    get_result(postcode)["msoa"]
  end

  def get_admin_district(postcode)
    get_result(postcode)["admin_district"]
  end

  def get_incode(postcode)
    get_result(postcode)["incode"]
  end

  def get_incode_length(postcode)
    get_incode(postcode).length
  end

  def get_query_index(postcode, index)
    get_result(postcode)[index]["query"]
  end

  def get_results_hash(postcode)
      result_hash_array = []
      get_result(postcode).each  do |x|
          result_hash_array << x["result"].class
      end
      result_hash_array
  end

  def get_postcodes_length(postcode)
    postcode_array = []
    get_result(postcode).each  do |x|
        postcode_array << x["result"]["postcode"].length.to_i
    end
    postcode_array
  end

  def get_quality_key(postcode)
    quality_array = []
    get_result(postcode).each  do |x|
        quality_array << x["result"]["quality"].to_i
    end
    quality_array
  end

  def get_eastings_value(postcode)
    eastings_array = []
    get_result(postcode).each  do |x|
      eastings_array << x["result"]["eastings"].to_i
    end
    eastings_array
  end

  def get_countries(postcode)
    country_array = []
    get_result(postcode).each  do |x|
      country_array << x["result"]["country"]
    end
    country_array
  end

  def get_NHS_authority(postcode)
    nhs_array = []
    get_result(postcode).each  do |x|
      nhs_array << x["result"]["nhs_ha"]
    end
    nhs_array
  end

  def get_long(postcode)
    long_array = []
    get_result(postcode).each  do |x|
      long_array << x["result"]["longitude"]
    end
    long_array
  end

  def get_lat(postcode)
    lat_array = []
    get_result(postcode).each  do |x|
      lat_array << x["result"]["latitude"]
    end
    lat_array
  end

  def get_parl_const(postcode)
    parliamentary_array = []
    get_result(postcode).each  do |x|
      parliamentary_array << x["result"]["parliamentary_constituency"]
    end
    parliamentary_array
  end




end

new_postcodes = Postcodesio.new
array = ["HA80PX","CH53PA","EH24ET","BT11AA"]
# p new_postcodes.get_single_postcode("HA80PX")
# p new_postcodes.get_incode(new_postcodes.get_single_postcode("HA80PX"))
# p new_postcodes.get_multiple_postcodes(array)
p new_postcodes.get_parl_const(new_postcodes.get_multiple_postcodes(array))
