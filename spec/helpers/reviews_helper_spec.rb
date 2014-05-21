require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ReviewsHelper do

  describe "#star_rating" do
  	
  	it 'shows 5 full stars when the rating is 5' do
  		expect(star_rating(5)).to eq("★★★★★")
  	end

  	it 'shows 3 full stars and 3 empty stars when the rating is 3' do
  		expect(star_rating(3)).to eq("★★★☆☆")
  	end

  end


end
