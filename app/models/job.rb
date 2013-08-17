class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :punchcards
  before_save :check_company

  private
    def check_company_company
      if self.company.name.empty?
        self.company = nil
      else
        self.company = Company.find_or_create_by(name: self.company.name)
      end
    end
end
