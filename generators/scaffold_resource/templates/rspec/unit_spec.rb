require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../spec_helper')

describe <%= class_name %> do
  fixtures :<%= plural_name %>

  describe "creating" do
    before(:each) do
      @<%= file_name %> = <%= class_name %>.new
    end

    it "should be valid" do
      @<%= file_name %>.should be_valid
    end
  end

  describe "existing" do
    before(:each) do
      @<%= file_name %> = <%= plural_name %>(:one)
    end

    it "should be valid" do
      @<%= file_name %>.should be_valid
    end
  end
end
