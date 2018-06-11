require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('ha80px') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_status(@response)).to eq 200
    end

    it "should have a results hash" do
      expect(@postcodesio.get_result(@response)).to be_kind_of Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_postcode_length(@response)).to be_between(5,7)
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_quality(@response)).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_eastings(@response)).to be_kind_of Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.get_country(@response)).to eq("England").or eq("Wales").or eq("Scotland").or eq("Northern Ireland")
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_NHS(@response)).to be_kind_of String
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_longitude(@response)).to be_kind_of Float
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_latitude(@response)).to be_kind_of Float
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_parliamentary(@response)).to be_kind_of String
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.get_european(@response)).to be_kind_of String
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_primary_care(@response)).to be_kind_of String
    end

    it "should return a region string" do
      expect(@postcodesio.get_region(@response)).to be_kind_of String
    end

    it "should return a parish string" do
      expect(@postcodesio.get_parish(@response)).to be_kind_of String
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_lsoa(@response)).to be_kind_of String
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_msoa(@response)).to be_kind_of String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.get_admin_district(@response)).to be_kind_of String
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_incode(@response)).to be_kind_of String
    end

    it "should return a incode string of 3-4 characters" do
      expect(@postcodesio.get_incode_length(@response)).to be_between(3 , 4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(["HA80PX","CH53PA","EH24ET","BT11AA"]) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_status(@response)).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
      # expect(@postcodesio.get_first_query(@response)).to include("HA80PX").or include("CH53PA").or include("EH24ET").or include("BT11AA")
      expect(@postcodesio.get_query_index(@response, 0)).to eq("HA80PX")
    end

    it "should return the second query as the second postcode in the response" do
      expect(@postcodesio.get_query_index(@response, 1)).to eq("CH53PA")
    end

    it "should have a results hash" do
      @postcodesio.get_results_hash(@response).each do |x|
        expect(x).to eq(Hash)
      end
    end

    it "should return a postcode between 5-7 in length"  do
      @postcodesio.get_postcodes_length(@response).each do |x|
        expect(x).to be_between(5,7)
      end
    end

    it "should return an quality key integer between 1-9" do
      @postcodesio.get_quality_key(@response).each do |x|
        expect(x).to be_kind_of Integer
        expect(x).to be_between(1,9)
      end
    end

    it "should return an ordnance survey eastings value as integer" do
      @postcodesio.get_eastings_value(@response).each do |x|
        expect(x).to be_kind_of Integer
      end
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      @postcodesio.get_countries(@response).each do |x|
        expect(x).to eq("England").or eq("Wales").or eq("Scotland").or eq("Northern Ireland")
      end
    end

    it "should return a string value for NHS authority " do
      @postcodesio.get_NHS_authority(@response).each do |x|
        expect(x).to be_kind_of String
      end
    end

    it "should return a longitude float value" do
      @postcodesio.get_long(@response).each do |x|
        expect(x).to be_kind_of Float
      end
    end

    it "should return a latitude float value" do
      @postcodesio.get_lat(@response).each do |x|
        expect(x).to be_kind_of Float
      end
    end

    it "should return a parliamentary constituency string" do
    end

    it "should return a european_electoral_region string" do
    end

    it "should return a primary_care_trust string" do
    end

    it "should return a region string" do
    end

    it "should return a parish string" do
    end

    it "should return a lsoa string" do
    end

    it "should return a msoa string" do
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
    end

    it "should return a incode string of three characters" do
    end

    it "should return a incode string of 3-4 characters" do
    end

  end


end
