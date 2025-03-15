
class SimpleCalculator
  class UnsupportedOperation < StandardError
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    begin
      if !ALLOWED_OPERATIONS.include? operation
        raise UnsupportedOperation.new
      end

      if !first_operand.is_a? Numeric
        raise ArgumentError.new("First operand #{first_operand} must be a Number")
      end
      if !second_operand.is_a? Numeric
        raise ArgumentError.new("Second operand #{second_operand} must be a Number")
      end

      result = first_operand.send(operation, second_operand)
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError => e
      "Division by zero is not allowed."
    end
  end
end
