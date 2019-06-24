require 'dry/monads/result'

module Result
  extend Dry::Monads::Result::Mixin

  class Info
    def initialize(message, loc, metadata={})
      @message = message
      @lineno = loc.lineno
      @label = loc.label
      @absolute_path = loc.absolute_path
      @path = loc.path
      @metadata = metadata.freeze
      @exception = @metadata.fetch(:exception, nil)
    end

    attr_reader :message, :path, :absolute_path, :file, :lineno, :metadata, :exception, :label

    def to_s
      trace_lines = [ "        from #{label} (#{path}:#{lineno})" ]
      if exception.nil?
        metadata_lines = metadata.keys.sort.map { |k| "        #{k.to_s}: #{metadata[k].to_s}" }
      else
        metadata_lines = [ "original exception: #{exception.message}", exception.backtrace ]
      end
      ([message] + trace_lines + metadata_lines).join("\n")
    end
  end

  def fail(message, metadata={})
    loc = caller_locations(1).first
    Failure(Info.new("Failure: #{message}", loc, metadata))
  end

  def wrap(&block)
    result = block.call
    if result.kind_of?(Success) || result.kind_of?(Failure)
      result
    else
      Success(result)
    end
  rescue => e
    loc = caller_locations(2).first
    Failure(Info.new("unexpected #{e.class.name}", loc, { exception: e }))
  end

  module_function :fail, :wrap
end
