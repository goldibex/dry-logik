require 'examples/better_failure'

RSpec.describe 'a better failure' do
  describe 'created by Result.fail' do
    it 'prints nicely in your spec suite' do
      expect(BetterFailure.blow_up_with_fail).to succeed
    end
  end

  describe 'created by Result.wrap' do
    it 'wraps the enclosed block of code and traps exceptions' do
      expect(BetterFailure.blow_up_with_wrap).to succeed
    end
  end
end
