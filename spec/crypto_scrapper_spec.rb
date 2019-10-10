require_relative '../lib/scrap'

describe "the scraping method" do
    it "should return an array not nil with at least one hash inside with a value " do
      expect(scraping).not_to be_nil
      expect(scraping).to eq([{ETH: value}])
    end
  end