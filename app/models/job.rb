class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :punchcards
  #before_save :check_company

  #accepts_nested_attributes_for :company
  attr_accessor :current_job

  validates :name, presence: true

  def current_job
    self.user.current_job == self.id ? true : false
  end

  private
  #  def check_company
  #    if self.company.present?
  #      if self.company.name.empty?
  #        self.company = nil
  #      else
  #        self.company = Company.find_or_create_by(name: self.company.name)
  #      end
  #    end
  #  end

end
