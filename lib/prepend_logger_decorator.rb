require "prepend_logger_decorator/version"

module PrependLoggerDecorator
  class Logger
    def initialize logger, prepend_msg
      @logger = logger
      @prepend_msg = prepend_msg
    end
  
    def method_missing(m, *args, &block)
      @logger.send(m, *args, &block)
    end
  
    [:debug, :info, :warn, :error, :fatal].each do |method|
      define_method method do |msg = nil, &block|
        @logger.send(method, "#{@prepend_msg}#{msg ? " #{msg}" : ""}", &block)
      end
    end
  end
end
