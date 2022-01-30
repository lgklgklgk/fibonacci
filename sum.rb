class Fibonacci
    # Public: initializes an instance of the Fibonacci class. Takes an optional hash of parameters:
    # max: The maximum value allowed for the Fibonacci sequence.
    # fibonacci_a: The first value in the sequence
    # fibonacci_b: The second value in the sequence
    # fibonacci_sum: The sum of the above two values which represents the next digit in the sequence.
    # EG: Fibonacci.new(max: 100, fibonacci_a: 3, fibonacci_b: 5)
    def initialize(**options)
        @max = options.fetch(:max) { 4_000_000 }
        @fibonacci_a = options.fetch(:fibonacci_a) { 0 }
        @fibonacci_b = options.fetch(:fibonacci_b) { 1 }
        @fibonacci_sum = @fibonacci_a + @fibonacci_b
    end

    # Public: Returns the sum of the even integers in the instance's Fibonacci sequence.
    # total: An optional starting value for the sum. Defaults to zero.
    # EG: Fibonacci.new.even_sum
    def even_sum(total = 0)
        while fibonacci_sum <= max do
            total += fibonacci_sum if fibonacci_sum.even?
            self.fibonacci_a = fibonacci_b
            self.fibonacci_b = fibonacci_sum
            self.fibonacci_sum = fibonacci_a + fibonacci_b
        end

        total
    end

    attr_reader :max
    attr_accessor :fibonacci_a, :fibonacci_b, :fibonacci_sum
end