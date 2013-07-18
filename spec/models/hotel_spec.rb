require 'spec_helper'

describe Hotel do

 # let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @hotel = Hotel.new(title: "Lorem ipsum", star_rating: 4.6, address_id: 1)
  end

  subject { @hotel }

  it { should respond_to(:title) }
  it { should respond_to(:star_rating) }
  it { should respond_to(:address_id) }
  it { should be_valid }

  describe "when title is not present" do
    before { @hotel.title = nil }
    it { should_not be_valid }
end

    describe "when star_rating is not present" do
    before { @hotel.star_rating = nil }
    it { should_not be_valid }
end
end