module Simple
  module Delicious
    class Configuration
      class << self
        attr_accessor :username, :password, :url

        def password
          @password || ""
        end #end of password

        def username
          @username || "" 
        end #end of username


        def url
          @url || "https://api.del.icio.us/v1/" 
        end #end of url

        def init &blk
          blk.call(self) if block_given?
        end #end of init &blk

        def reset
          @password = @username = "" and @url = "https://api.del.icio.us/v1/"  
        end #end of reset!
      end
    end
  end
end
