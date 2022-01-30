class Fibonacci
    # Public: initializes an instance of the Fibonacci class. Takes an optional hash of parameters:
    # max: The maximum value allowed for the Fibonacci sequence.
    # fibonacci_a: The first value in the sequence
    # fibonacci_b: The second value in the sequence
    # fibonacci_sum: The sum of the above two values which represents the next digit in the sequence.
    # sequence: The fibonacci sequence generated based on the parameters
    # EG: Fibonacci.new(max: 100, fibonacci_a: 3, fibonacci_b: 5)
    def initialize(**options)
        @max = options.fetch(:max) { 4_000_000 }
        @fibonacci_a = options.fetch(:fibonacci_a) { 1 }
        @fibonacci_b = options.fetch(:fibonacci_b) { 2 }
        @fibonacci_sum = @fibonacci_a + @fibonacci_b
        @sequence = options.fetch(:sequence) { generate_sequence }
    end

    # Public: Generates a valid Fibonacci sequence based on the parameters passed to the instance.
    # EG: Fibonacci.new(max: 100, fibonacci_a: 3, fibonacci_b: 5).sequence
    def generate_sequence
        case max
        when 1
            [1]
        when 2
            [1, 2]
        else
            arr = [fibonacci_a, fibonacci_b, fibonacci_sum]
            loop do
                self.fibonacci_a = fibonacci_b
                self.fibonacci_b = fibonacci_sum
                self.fibonacci_sum = fibonacci_a + fibonacci_b
                break if fibonacci_sum > max
                arr << fibonacci_sum
            end

            self.sequence = arr
        end
    end

    # Public: Returns the sum of the even integers in the instance's Fibonacci sequence.
    # EG: Fibonacci.new.even_sum
    def even_sum
        return 0 if sequence.empty?
        sequence.select(&:even?).reduce(:+) || 0
    end

    attr_reader :max
    attr_accessor :fibonacci_a, :fibonacci_b, :fibonacci_sum, :sequence
end