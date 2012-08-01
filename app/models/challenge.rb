require "stringio"

module Kernel
  def execute_in_sandbox
    out = StringIO.new
    $stdout = out
    return yield, out.string
  ensure
    $stdout = STDOUT
  end
end

class Challenge < ActiveRecord::Base
  attr_accessible :hints, :level, :position, :question, :solution, 
    :topic, :input_pattern, :output_pattern, :result, :pre_condition

  validates :position, presence: true, numericality: { greater_than: 0 }, uniqueness: true
  validates :level, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 3 }  
  validates :question, presence: true
  validates :hints, presence: true
  validates :solution, presence: true
  validates :topic, presence: true

  scope :default_order, order("challenges.position ASC")


  validate :check_solution

  private

  def check_solution
    if input_pattern.present?
      unless eval(input_pattern) =~ solution
        errors.add(:solution, "does not match input_pattern")
      end
    end

    if output_pattern.present? or result.present?
      temp_result, output = execute_in_sandbox do
        temp_solution = self.solution
        temp_solution = "#{self.pre_condition}\n#{temp_solution}" if self.pre_condition.present?
        begin
          eval(temp_solution)
        rescue Exception => ex
          errors.add(:solution, "#{ex.class.to_s}: #{ex.message}")
          return
        end
      end
      if output_pattern.present?
        errors.add(:solution, "output does not match output_pattern") unless eval(output_pattern) =~ output
      end
      if result.present?        
        errors.add(:solution, "does not generate expected result") unless eval(result) == temp_result
      end
    end
  end

end
