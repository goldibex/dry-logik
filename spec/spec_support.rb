require 'dry/monads/result'
require 'rspec/expectations'

RSpec::Matchers.define :succeed do |expected|
  match do |actual|
    actual.kind_of?(Dry::Monads::Success)
  end

  failure_message do |actual|
    if actual.kind_of?(Dry::Monads::Failure)
      "expected Success, but got #{actual.failure.to_s}"
    else
      "expected Success, but got non-Result #{actual.inspect}"
    end
  end

  description do
    "succeed"
  end
end
