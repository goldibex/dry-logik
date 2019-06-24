require 'dry/monads'
require 'dry/monads/result'

module Failure
  extend Dry::Monads::Result::Mixin

  def fail_raise
    foo
  end

  def fail_failure
    foo
  rescue => error
    Failure(error)
  end

  def foo
    bar
  end

  def bar
    baz
  end

  def baz
    raise RuntimeError, 'wat'
  end

  module_function :fail_raise, :fail_failure, :foo, :bar, :baz
end
