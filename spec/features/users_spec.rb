require 'spec_helper'

describe "User" do 
   before(:each) do
      user = FactoryGirl.create(:user)
      login user
   end	

   describe "user access" do

      it "should show the file to uploaded user" do
        #upload a file from user
		file_upload
		visit documents_path
		expect(page).to have_text("Access control test") 
      end

      it "shouldnot show the file to non-owner" do
        #upload a file from user
		file_upload
		logout

		#login from visitor and he should not see the document
		login FactoryGirl.create(:user, :email => 'visitor@gmail.com')
		visit documents_path
		expect(page).not_to have_text("Access control test")
      end	
   end

   private
   def login user
      visit root_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button 'Sign in'
   end

   def logout
     visit root_path
     click_link 'Sign out' 
   end	

   def file_upload
   	  visit documents_path
      click_link 'New document'
      fill_in 'document_title', :with => 'Access control test'
      attach_file("document_document", File.join(Rails.root, 'spec', 'support', 'sample.txt'))
      click_button 'Upload'	
   end	

end