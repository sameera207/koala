class Document < ActiveRecord::Base
  attr_accessible :document, :title
  mount_uploader :document, DocumentUploader

  validates :title, :presence => true

end
