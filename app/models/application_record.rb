class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def checked?(report)
    ActiveRecord::Type::Boolean.new.cast(report:[done])
  end
  self.abstract_class = true
end
