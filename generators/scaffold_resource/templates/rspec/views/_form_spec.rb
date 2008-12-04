require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../../spec_helper')

describe "/<%= table_name %>/edit.<%= default_file_extension %>" do
  include <%= controller_class_name %>Helper
  
  before do
    @<%= file_name %> = mock_model(<%= class_name %>)
<% for attribute in attributes -%>
    @<%= file_name %>.stub!(:<%= attribute.name %>).and_return(<%= attribute.default_value %>)
<% end -%>
    assigns[:<%= file_name %>] = @<%= file_name %>
  end

  def render_form
    builder = ActionView::Base.default_form_builder
    form = builder.new('<%= file_name %>', @<%= file_name %>, template, {}, nil)
    render :partial => "/<%= table_name %>/form",
      :locals => {:f => form}
  end

  it "should render form" do
    render_form
    
<% for attribute in attributes -%><% unless attribute.name =~ /_id/ || [:datetime, :timestamp, :time, :date].index(attribute.type) -%>
    response.should have_tag('<%= attribute.input_type -%>#<%= file_name %>_<%= attribute.name %>[name=?]', "<%= file_name %>[<%= attribute.name %>]")
<% end -%><% end -%>
  end
end
