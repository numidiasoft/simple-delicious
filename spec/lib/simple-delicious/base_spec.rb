require "spec_helper"

describe "Base" do
  describe "init delicious base module " do
    it "should return base instance " do
      simpleD = Simple::Delicious::Base.new "user", "password" 
      simpleD.should be_an_instance_of(Simple::Delicious::Base)
    end
  end

  describe " fetch" do
   before do

   end
   context "When resource asked is tags" do
     it "should return all tags"
   end

   context "When resource asked is posts" do
   end

   context "When the resource asked is tag's posts" do

   end
  end
end
