module Simple 
  module Delicious
    class Response
      attr_accessor :data, :code, :header, :parsed_response, :resource

      def initialize response, resource
        @parsed_response = response.parsed_response
        @data = response.body
        @code = response.code
        @header = response.header
        @resource = resource.split("/").last
      end #end of intialize response


      def each &block
        return elements.to_enum  if !block_given?
        for element in elements
          block.call(element)
        end
      end #end of each

      def method_missing name, *args
        if name.to_s == "element" 
          raise "wrong number of arguments(#{args.size} for 2)" if args.size != 2
          elements.select { |el| 
            el[args.first] == args.last
          }
          return result = elements.empty? ? nil : Builder.new(singular_r_name, elements.first).build
        end
        super
      end #end of method_missing name, *args


      def elements
        parsed_response[@resource.to_s][singular_r_name] || parsed_response[@resource.to_s] || []
      end #end of elements

      def singular_r_name
        @resource.match(/^(.+)(s)$/)[1]
      end #end of singular_r_name
    end
  end
end
