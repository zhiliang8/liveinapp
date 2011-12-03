require 'spec_helper'

describe "apps/new.html.erb" do
  before(:each) do
    assign(:app, stub_model(App,
      :name => "MyString",
      :url => "MyString",
      :desc => "MyString"
    ).as_new_record)
  end

  it "renders new app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apps_path, :method => "post" do
      assert_select "input#app_name", :name => "app[name]"
      assert_select "input#app_url", :name => "app[url]"
      assert_select "input#app_desc", :name => "app[desc]"
    end
  end
end
