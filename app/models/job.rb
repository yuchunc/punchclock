class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :punchcards
end
