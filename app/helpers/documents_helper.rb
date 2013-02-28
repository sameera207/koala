module DocumentsHelper
	def button_text(obj)
	   obj.new_record? ? "Upload" : "Update"	
	end
end
