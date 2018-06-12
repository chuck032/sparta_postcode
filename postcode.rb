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

# Methods for single postcode
# Method to find status key
  def get_status(postcode)
    postcode["status"]
  end

# Method to find result
  def get_result(postcode)
    postcode["result"]
  end

# Method to find length of postcode within result hash
  def get_postcode_length(postcode)
    get_result(postcode)["postcode"].length
  end

  # Method to find quality within result hash
  def get_quality(postcode)
    get_result(postcode)["quality"]
  end

  # Method to find eastings within result hash
  def get_eastings(postcode)
    get_result(postcode)["eastings"]
  end

  # Method to find country within result hash
  def get_country(postcode)
    get_result(postcode)["country"]
  end

  # Method to find NHS authority within result hash
  def get_NHS(postcode)
    get_result(postcode)["nhs_ha"]
  end

  # Method to find longitude within result hash
  def get_longitude(postcode)
    get_result(postcode)["longitude"]
  end

  # Method to find latitude within result hash
def get_latitude(postcode)
    get_result(postcode)["latitude"]
  end

  # Method to find parliamentary constituency within result hash
  def get_parliamentary(postcode)
    get_result(postcode)["parliamentary_constituency"]
  end

  # Method to find European electoral region within result hash
  def get_european(postcode)
    get_result(postcode)["european_electoral_region"]
  end

  # Method to find primary care trust within result hash
  def get_primary_care(postcode)
    get_result(postcode)["primary_care_trust"]
  end

  # Method to find region within result hash
  def get_region(postcode)
    get_result(postcode)["region"]
  end

  # Method to find parish within result hash
  def get_parish(postcode)
    get_result(postcode)["parish"]
  end

  # Method to find lsoa within result hash
  def get_lsoa(postcode)
    get_result(postcode)["lsoa"]
  end

  # Method to find msoa within result hash
  def get_msoa(postcode)
    get_result(postcode)["msoa"]
  end

  # Method to find admin district within result hash
  def get_admin_district(postcode)
    get_result(postcode)["admin_district"]
  end

  # Method to find incode within result hash
  def get_incode(postcode)
    get_result(postcode)["incode"]
  end

  # Method to find the length of the incode
  def get_incode_length(postcode)
    get_incode(postcode).length
  end

  # Method multi-postcodes
  # Method to find query within the index of the array and result hash
  def get_query_index(postcode, index)
    get_result(postcode)[index]["query"]
  end

  # Method to find data type of all postcodes
  def get_results_hash(postcode)
      result_hash_array = []
      get_result(postcode).each  do |x|
          result_hash_array << x["result"].class
      end
      result_hash_array
  end

  # Method to find the length of postcodes within the result hash for all postcodes
  def get_postcodes_length(postcode)
    postcode_array = []
    get_result(postcode).each  do |x|
        postcode_array << x["result"]["postcode"].length.to_i
    end
    postcode_array
  end

  # Method to find quality within the result hash, for all postcodes
  def get_quality_key(postcode)
    quality_array = []
    get_result(postcode).each  do |x|
        quality_array << x["result"]["quality"].to_i
    end
    quality_array
  end

  # Method to find eastings within the result hash, for all postcodes
    def get_eastings_value(postcode)
    eastings_array = []
    get_result(postcode).each  do |x|
      eastings_array << x["result"]["eastings"].to_i
    end
    eastings_array
  end

  # Method to find country within the result hash, for all postcodes
  def get_countries(postcode)
    country_array = []
    get_result(postcode).each  do |x|
      country_array << x["result"]["country"]
    end
    country_array
  end

  # Method to find NHS authority within the result hash, for all postcodes
  def get_NHS_authority(postcode)
    nhs_array = []
    get_result(postcode).each  do |x|
      nhs_array << x["result"]["nhs_ha"]
    end
    nhs_array
  end

  # Method to find longitude within the result hash, for all postcodes
  def get_long(postcode)
    long_array = []
    get_result(postcode).each  do |x|
      long_array << x["result"]["longitude"]
    end
    long_array
  end

  # Method to find latitude within the result hash, for all postcodes
  def get_lat(postcode)
    lat_array = []
    get_result(postcode).each  do |x|
      lat_array << x["result"]["latitude"]
    end
    lat_array
  end

  # Method to find parliamentary constituency within the result hash, for all postcodes
  def get_parl_const(postcode)
    parliamentary_array = []
    get_result(postcode).each  do |x|
      parliamentary_array << x["result"]["parliamentary_constituency"]
    end
    parliamentary_array
  end

  # Method to find European electoral region within the result hash, for all postcodes
  def get_euro_elect(postcode)
    euro_array = []
    get_result(postcode).each  do |x|
      euro_array << x["result"]["european_electoral_region"]
    end
    euro_array
  end

  # Method to find primary care trust within the result hash, for all postcodes
  def get_prim_care(postcode)
    primary_array = []
    get_result(postcode).each  do |x|
      primary_array << x["result"]["primary_care_trust"]
    end
    primary_array
  end

  # Method to find region within the result hash, for all postcodes, excluding nil values
  def get_reg(postcode)
    region_array = []
    get_result(postcode).each  do |x|
      if x["result"]["region"] != nil
        region_array << x["result"]["region"]
      end
    end
    region_array
  end

  # Method to find parish within the result hash, for all postcodes, excluding nil values
  def get_par(postcode)
    parish_array = []
    get_result(postcode).each  do |x|
      if x["result"]["parish"] != nil
        parish_array << x["result"]["parish"]
      end
    end
    parish_array
  end

  # Method to find lsoa within the result hash, for all postcodes
  def get_lsoa_mult(postcode)
    lsoa_array = []
    get_result(postcode).each  do |x|
      lsoa_array << x["result"]["lsoa"]
    end
    lsoa_array
  end

  # Method to find msoa within the result hash, for all postcodes, excluding nil values
  def get_msoa_mult(postcode)
    msoa_array = []
    get_result(postcode).each  do |x|
      if x["result"]["msoa"] != nil
        msoa_array << x["result"]["msoa"]
      end
    end
    msoa_array
  end

  # Method to find admin district within the result hash, for all postcodes
  def get_admin_dis(postcode)
    admin_array = []
    get_result(postcode).each  do |x|
      admin_array << x["result"]["admin_district"]
    end
    admin_array
  end

  # Method to find length of incode within the result hash, for all postcodes
  def get_incode_char(postcode)
    incode_array = []
    get_result(postcode).each  do |x|
      incode_array << x["result"]["incode"].length
    end
    incode_array
  end
end
