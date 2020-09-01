require_relative '../lib/checker.rb'

describe Checker do
let(:file_rspec) { Checker.new('../bin/tester.txt') }
    describe '#file_checker' do
        context 'Method is given the secunce to check on the file' do
            #positive scenario
            it 'returns 2 arrays each with the index where the secunce was found' do
                expect(file_rspec.file_checker(/\(/, /\)/).class).to eql(Array)
            end
            #negative scenario
            it 'returns error when it the methos is given no arguments' do
                expect{ file_rspec.file_checker }.to raise_error(ArgumentError)
            end
        end
    end
    describe '#file_analizer' do
        context 'Method takes care of the logic to determin where the errors could be' do
            #positive scenario
            it 'returns two arrays each with the position where there could be an error' do
                expect(file_rspec.file_analizer(/\[/, /\]/).class).to eql(Array)
            end
            #negative scenario
            it 'returns error when method is given no arguments' do
                expect{ file_rspec.file_analizer }.to raise_error(ArgumentError)
            end
        end
    end
end