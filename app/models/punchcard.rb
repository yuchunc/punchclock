class Punchcard < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  scope :this_week, -> { where(["punchin > ?", Time.now]) }

end
