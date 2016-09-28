class Student < ActiveRecord::Base
  has_enumeration_for :status, with: Status, create_helpers: {prefix: true}

  validates_presence_of :name, :register_number, :status
  validates_uniqueness_of :register_number
end
