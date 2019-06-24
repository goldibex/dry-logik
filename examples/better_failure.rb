require 'lib/result'

module BetterFailure
  def blow_up_with_fail
    Result.fail('problem exists between keyboard and chair', { hour: "late", tired: true, bozo_bit: 1 })
  end

  def failing_method
    raise RuntimeError, 'runtime failure: unexpected blob'
  end

  module_function :failing_method

  def blow_up_with_wrap
    Result.wrap { failing_method }
  end

  module_function :blow_up_with_fail, :blow_up_with_wrap
end
