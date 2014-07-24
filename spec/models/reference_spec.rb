require 'rails_helper'

RSpec.describe Reference, :type => :model do

  it "has a valid factory" do
    expect(build(:reference)).to be_valid
  end

end
