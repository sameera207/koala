require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the DocumentsHelper. For example:
#
# describe DocumentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe DocumentsHelper do
  
  it "should return upload for new document" do
       document = Document.new
  	   button_text(document).should == "Upload"
  end

  it "should return 'Update' for new document" do
       document = FactoryGirl.create(:document)
  	   button_text(document).should == "Update"
  end	
end
