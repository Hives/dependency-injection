require 'greeter'

describe Greeter do
  describe '#greet' do
    it 'gets your name and prints a greeting' do
      input = "My Name\n"
      kernel = double(:kernel)
      allow(kernel).to receive(:gets).and_return(input)
      greeter = described_class.new(kernel)
      expect { greeter.greet }.to output("What is your name?\nHello, #{input}").to_stdout
    end
  end
end
