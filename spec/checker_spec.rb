require_relative '../lib/checker.rb'

describe Checker do
  let(:file_rspec) { Checker.new('testers/tester.rb') }
  describe '#file_checker' do
    context 'Method is given two regex to look for in the file' do
      # positive scenario
      it 'returns an array with the position where an error was found' do
        expect(file_rspec.file_checker(/\(/, /\)/).class).to eql(Array)
      end
      # negative scenario
      it 'returns error when it the methos is given no arguments, must have two arguments' do
        expect { file_rspec.file_checker() }.to raise_error(ArgumentError)
      end
    end
  end
end
