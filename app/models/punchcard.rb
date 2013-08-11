class Punchcard < ActiveRecord::Base
  belongs_to :user

  scope :this_week, -> { where(["punchin > ?", Time.now]) }

end
