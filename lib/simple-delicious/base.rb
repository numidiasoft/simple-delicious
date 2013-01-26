require "httparty"
module Simple
  module Delicious
    class Base
      include HTTParty
      base_uri Configuration.url

      def initialize user = Configuration.username, password = Configuration.password 
        @auth = {:username => user, :password => password}
      end #end of initialize


      def current_user
        @auth
      end #end of auth


      def fetch resource, options = {}
        resource = check_resource!(resource)
        path = "#{format(options)}/#{resource.to_s}/#{action(resource, options)}"
        Response.new(self.class.get(path, {:query => options}.merge(:basic_auth => @auth)), resource.to_s)
      end #end of fetch


      def method_missing method_name, *args 
        if resources.include?(method_name.to_s)
          return self.fetch(method_name, *args)
        end
        super
      end #end of method_messing method_name, *args



      private
      def format options
        format = options.delete(:format)
        format == "json" ? "/"+format : "" 
      end #end of path

      def action resource, options
        if resource.to_s == "tags"
          return options.delete(:action) || "get"    
        else
          return  options.delete(:action) || "all" 
        end
      end #end of action options

      def check_resource! resource  
        resources.include?(resource.to_s) ? resource_parsed(resource) : raise("resource should be in  [tags, posts, bundles]") 
      end #end of resource options

      def resources
        %w(tags posts bundles)
      end #end of resources

      def resource_parsed resource
        resource_name = case resource.to_s
                        when "tags"
                          return "tags"
                        when "posts"
                          return "posts"
                        when  "bundles"
                          return "tags/bundles"
                        end
      end #end of resource_parsed
    end
  end
end
