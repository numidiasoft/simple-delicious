require "log4r"

module Simple
  module Delicious
    module Log
        include Log4r

        def self.new(name, outputer = Outputter.stdout )
          @logger = Logger.new name
          @logger.outputters = outputer and @logger
        end #end of initialize(name)

    end
  end
end
