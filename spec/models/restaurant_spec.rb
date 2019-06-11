require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:cuisine) }

    it { should have_many(:favorites) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
