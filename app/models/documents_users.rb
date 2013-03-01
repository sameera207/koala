class DocumentsUsers < ActiveRecord::Base
  attr_accessible :document_id, :user_id
  
  belongs_to :documents
  belongs_to :users

end
