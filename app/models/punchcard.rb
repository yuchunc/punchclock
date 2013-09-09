class Punchcard < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  #scope :month, lambda { |month| where('extract(month from created_at) = ?', month) } #sql version
  scope :month, lambda { |month| where("strftime('%m', created_at) = ?", month) } #sqlite version

  #scope :this_week, -> { where("punchin > ?", Time.now) }

end
