require 'examples/failure'

RSpec.describe 'an error' do
  context 'signaled by an exception' do
    it 'has a backtrace' do
      Failure.fail_raise
    end
  end

  context 'signaled by a Dry::Result::Failure' do
    it 'has no backtrace' do
      expect(Failure.fail_failure).to be_success
    end
  end
end
