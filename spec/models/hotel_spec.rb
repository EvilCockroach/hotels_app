require 'spec_helper'

describe Hotel do

 # let(:hotel) { FactoryGirl.create(:hotel) }
  before do
    # This code is wrong!
    @hotel = Hotel.new(title: "Lorem ipsum", star_rating: 7.0,
                        rates_count: 2)
  end

  subject { @hotel }

  it { should respond_to(:title) }
  it { should respond_to(:star_rating) }
  #it { should respond_to(:address_id) }
  it { should respond_to(:rates_count) }
  #it { should respond_to(:hphoto) }
  
  it { should be_valid }

  describe "when title is not present" do
    before { @hotel.title = nil }
    it { should_not be_valid }
end

    describe "when star_rating is not present" do
    before { @hotel.star_rating = nil }
    it { should_not be_valid }
end

describe "when rates_count is not present" do
    before { @hotel.rates_count = nil }
    it { should_not be_valid }
end

describe "when title is too long" do
    before { @hotel.title = "a" * 51 }
    it { should_not be_valid }
  end

describe "when hotel title already exists" do
    before do
      hotel_with_same_title = @hotel.dup
      hotel_with_same_title.title = @hotel.title.upcase
      hotel_with_same_title.save
    end
    it { should_not be_valid }
  end

end