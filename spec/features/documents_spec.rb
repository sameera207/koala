require 'spec_helper'

describe "Documents" do
 
    before(:each) do
      user = FactoryGirl.create(:user)
      visit root_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button 'Sign in'
    end
   
  
  describe "GET /documents" do
    it "should display document name as sameera CV" do
      @document = FactoryGirl.create(:document)
      visit documents_path
      expect(page).to have_text("sameera CV")
      expect(page).to have_text("downlaod")
    end
  end

  describe "POST /documents" do
     it "should upload a new document" do
       visit documents_path
       click_link 'New document'
       fill_in 'document_title', :with => 'sample title'
       attach_file("document_document", File.join(Rails.root, 'spec', 'support', 'sample.txt'))
       click_button 'Upload'
       expect(page).to have_text("Document was successfully created.")
     end
  end

  describe "PUT /documents" do
     it "should edit an existing document" do
       @document = FactoryGirl.create(:document)
       visit documents_path
       click_link @document.title
       find_field('document_title').value.should == "sameera CV"
       fill_in 'document_title', :with => 'sameera CV Edited'
       click_button 'Update'
       expect(page).to have_text("Document was successfully updated.")
     end
  end

end
