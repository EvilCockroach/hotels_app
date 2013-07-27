require 'spec_helper'

describe "Hotel pages" do

	subject { page }

	describe "hotel details" do
  let(:hotel) { FactoryGirl.create(:hotel) }
      before { visit user_path(hotel) }

    it { should have_selector('h1',    text: hotel.name) }
    it { should have_selector('title', text: hotel.name) }
  end

  describe "adding" do

    before { visit new_hotel_path }

    let(:submit) { "Create" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Hotel, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'New hotel') }
       # it { should have_content('error') }
      end

       end

    describe "with valid information" do
      before do
        fill_in "title",         with: "Example Title"
        fill_in "star_rating",   with: 20
        fill_in "rates_count",     with: 6
        
      end



      describe "after saving the hotel" do
        before { click_button submit }
        let(:hotel) { Hotel.find_by_title('Example Title') }

        it { should have_selector('title', text: hotel.title) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end


    end
  
end
end