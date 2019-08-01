require "logger"

RSpec.describe PrependLoggerDecorator do
  it "has a version number" do
    expect(PrependLoggerDecorator::VERSION).not_to be nil
  end

  it "overrides log correctly" do
    logger = Logger.new(STDOUT)
    decorated_logger = PrependLoggerDecorator::Logger.new(logger, "message")
    expect(logger).to receive(:info).with("message foo")
    decorated_logger.info("foo")
  end
end
