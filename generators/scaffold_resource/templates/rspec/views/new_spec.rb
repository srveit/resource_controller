require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper')

describe "/<%= table_name %>/new.<%= default_file_extension %>" do
  include <%= controller_class_name %>Helper
  
  before(:each) do
    @<%= file_name %> = mock_model(<%= class_name %>)
    @<%= file_name %>.stub!(:new_record?).and_return(true)
    assigns[:<%= file_name %>] = @<%= file_name %>


    template.stub!(:object_url).and_return(<%= file_name %>_path(@<%= file_name %>)) 
    template.stub!(:collection_url).and_return(<%= file_name.pluralize %>_path) 
  end

  it "should render new form" do
    template.should_receive(:error_messages_for).and_return('')
    template.should_receive(:render).with(hash_including(:partial => 'form'))

    render "/<%= table_name %>/new.<%= default_file_extension %>"
    
    response.should have_tag("form[action=?][method=post]", <%= table_name %>_path) do
    end
  end
end
