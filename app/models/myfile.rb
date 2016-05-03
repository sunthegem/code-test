class Myfile < ActiveRecord::Base
  include ApplicationHelper

  belongs_to :mydirectory, class_name: 'Mydirectory'
  validates :name, presence: true
  validate :duplicate_name

end
