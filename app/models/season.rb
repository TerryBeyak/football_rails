class Season < ActiveRecord::Base
  attr_accessible :year

  has_many :weeks

  validates_numericality_of :year

  def to_param
    id
  end
end
