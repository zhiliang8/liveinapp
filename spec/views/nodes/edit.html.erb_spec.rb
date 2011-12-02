require 'spec_helper'

describe "nodes/edit.html.erb" do
  before(:each) do
    @node = assign(:node, stub_model(Node,
      :name => "MyString",
      :summary => "MyString",
      :sort => 1
    ))
  end

  it "renders the edit node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nodes_path(@node), :method => "post" do
      assert_select "input#node_name", :name => "node[name]"
      assert_select "input#node_summary", :name => "node[summary]"
      assert_select "input#node_sort", :name => "node[sort]"
    end
  end
end
