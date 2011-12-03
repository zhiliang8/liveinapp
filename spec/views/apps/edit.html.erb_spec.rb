require 'spec_helper'

describe "apps/edit.html.erb" do
  before(:each) do
    @app = assign(:app, stub_model(App,
      :name => "MyString",
      :url => "MyString",
      :desc => "MyString"
    ))
  end

  it "renders the edit app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apps_path(@app), :method => "post" do
      assert_select "input#app_name", :name => "app[name]"
      assert_select "input#app_url", :name => "app[url]"
      assert_select "input#app_desc", :name => "app[desc]"
    end
  end
end
