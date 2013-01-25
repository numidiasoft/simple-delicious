require "spec_helper"
describe "Builder" do
  before do
    @options = {:name => "Iha", :last_name => "Tarik"}
    @class_name = "Tag"
  end


  context "When Params is valid" do
    it "should build an object" do
      builder =  Simple::Delicious::Builder.new(@class_name, @options)
      object = builder.build()
      object.should be_an_instance_of(Simple::Delicious::Builder::Tag)
      object.methods.should include(:name, :last_name)
    end
  end

  context "When params is not valid" do
    context "Second param is not Hash" do
      before do 
        @options = []
      end

      it "should raise a runtime error " do
        -> {
          builder =  Simple::Delicious::Builder.new("Tag", @options)
          builder.build()}.should raise_error(RuntimeError, "Second  parameter should be a Hash")
      end
    end

    context "First param is not String " do
      before do
        @class_name = "1"
      end
      it "should raise a runtime error " do
        -> {
          builder =  Simple::Delicious::Builder.new(@class_name, @options)
          builder.build()}.should raise_error(NameError, "wrong constant name 1")
      end
    end
  end
end
