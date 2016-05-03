module ApplicationHelper

  
  def duplicate_name
    if self.mydirectory_id
	  curr_dir = Mydirectory.find(self.mydirectory_id)
	  if (curr_dir.mydirectories.pluck(:name)+curr_dir.myfiles.pluck(:name)).include? self.name
	    errors.add("directory/file", "with name '#{self.name}' already exists, Please choose a different name")
      end		
    else (Mydirectory.where(mydirectory_id: nil).pluck(:name) + Myfile.where(mydirectory_id: nil).pluck(:name)).include? self.name
      errors.add("directory/file", "with name '#{self.name}' already exists, Please choose a different name")
    end
  end
  
end
