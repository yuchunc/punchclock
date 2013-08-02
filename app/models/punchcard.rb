class Punchcard < ActiveRecord::Base
  scope :this_week, ~> { where("punchin > ?", Time.now ) }
end
