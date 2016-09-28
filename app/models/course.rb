class Course < ActiveRecord::Base
  has_enumeration_for :status, with: Status, create_helpers: {prefix: true}

  validates_presence_of :name, :description, :status
end
