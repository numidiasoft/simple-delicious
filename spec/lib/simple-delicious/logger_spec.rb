require "simple-delicious/logger"
require "spec_helper"

describe "Log" do
 
  describe "new" do
    before do
      @logger = Simple::Delicious::Log.new("stdout")
    end

    it "should return log4j:logger object" do
      @logger.should be_an_instance_of(Log4r::Logger)
    end

    it "should return Log4r::StdoutOutputter outputer " do
      @logger.instance_variable_get("@outputters").first.should be_an_instance_of(Log4r::StdoutOutputter)
    end

    it "should return right full name" do
      @logger.instance_variable_get("@fullname").should be_eql("stdout")
    end
  end

end
