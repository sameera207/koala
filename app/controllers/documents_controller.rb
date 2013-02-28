class DocumentsController < ApplicationController
  
  def index
  	@documents = Document.all
  end

  def new
  	@document = Document.new	
  end	

  def create
  	@document = Document.new(params[:document])
  	if @document.save
  	   redirect_to documents_path, notice: 'Document was successfully created.' 	
  	else
  	   render :action => 'new'		
  	end
  end

  def edit
  	@document = Document.find(params[:id])
  end

  def update
  	@document = Document.find(params[:id])
  	if @document.update_attributes(params[:document])
  	   redirect_to documents_path, notice: 'Document was successfully updated.' 	
  	else
  	   render :action => 'edit'		
  	end
  end

  def download
  	document = Document.find(params[:id])
    file_path = "#{Rails.root.to_s}/public#{document.document_url.to_s}"
    send_file(file_path)
  end	

end
