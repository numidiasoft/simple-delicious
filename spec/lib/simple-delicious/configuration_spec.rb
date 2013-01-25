require "spec_helper"

describe "Configuration" do
  before do
    @config = Simple::Delicious::Configuration 
    @config.init do |config|
      config.url = "https://www.tigerlillyapps.com"
      config.username = "username"
      config.password = "password"
    end
  end


  describe "init" do
    it "should init configuration" do
      @config.url.should be_eql("https://www.tigerlillyapps.com")
      @config.username.should be_eql("username")
      @config.password.should be_eql("password")
    end
  end


  describe "reset" do
    describe "it should reset config values" do
      before do
        @config.reset  
      end

       it "should set initial values" do
         @config.url.should be_eql("https://api.del.icio.us/v1/")
         @config.username.should be_eql("")
         @config.password.should be_eql("")
       end
    end
  end

end
