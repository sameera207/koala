require 'spec_helper'

describe Document do
  describe "validations" do
     it {should validate_presence_of(:title)}	
  end	
end
