require "rails_helper"

RSpec.describe CountryFacade do
  describe "instance methods" do
    describe "random country" do
      it "eturns single country name" do
        VCR.use_cassette("random_country") do
          country = CountryFacade.new.random_country

          expect(country).to be_a(String)
        end
      end
    end
  end
end