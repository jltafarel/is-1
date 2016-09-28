class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates_presence_of :entry_at

  def formatted_entry_at
    I18n.l entry_at, format: :long
  end
end
