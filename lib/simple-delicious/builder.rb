module Simple
  module Delicious
    class Builder
      def initialize class_name, options
         @options = options.is_a?(Hash)  ? options : raise("Second  parameter should be a Hash")
         @class_name = class_name.is_a?(String) ? class_name.capitalize : raise("First  parameter should be a String") 
      end #end of initialize class_name, options
      
      def build
        klass = create_class(@class_name, @options)
        klass.new
      end #end of build

      private
      def create_class(class_name, options)
        c = Class.new do
          attr_accessor *options.keys

          define_method :initialize do
            options.keys.each_with_index do |name,i|
              instance_variable_set("@#{name}", options[name])
            end
          end
        end
        Simple::Delicious::Builder.send(:remove_const, class_name) rescue nil
        Simple::Delicious::Builder.const_set class_name, c
      end #end of create_class
    end
  end
end
