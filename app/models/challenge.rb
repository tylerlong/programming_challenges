class Challenge < ActiveRecord::Base
  attr_accessible :hints, :level, :position, :question, :solution

  validates :position, presence: true, numericality: { greater_than: 0 }, uniqueness: true
  validates :level, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 3 }  
  validates :question, presence: true
  validates :hints, presence: true
  validates :solution, presence: true
end
