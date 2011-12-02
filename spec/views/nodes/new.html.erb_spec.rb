require 'spec_helper'

describe "nodes/new.html.erb" do
  before(:each) do
    assign(:node, stub_model(Node,
      :name => "MyString",
      :summary => "MyString",
      :sort => 1
    ).as_new_record)
  end

  it "renders new node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nodes_path, :method => "post" do
      assert_select "input#node_name", :name => "node[name]"
      assert_select "input#node_summary", :name => "node[summary]"
      assert_select "input#node_sort", :name => "node[sort]"
    end
  end
end
