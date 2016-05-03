class Mydirectory < ActiveRecord::Base
  include ApplicationHelper

  belongs_to :mydirectory
  validates :name, presence: true
	
  validate :duplicate_name
  
  has_many :myfiles, dependent: :destroy
  has_many :mydirectories, class_name: 'Mydirectory', foreign_key: 'mydirectory_id'
  
  def absolute_path
    dirs = []
    dir = self
	while(dir) do
	  dirs << dir
	  dir = dir.mydirectory
	end
	dirs.reverse
  end

end
