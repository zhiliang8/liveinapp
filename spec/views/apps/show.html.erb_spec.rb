require 'spec_helper'

describe "apps/show.html.erb" do
  before(:each) do
    @app = assign(:app, stub_model(App,
      :name => "Name",
      :url => "Url",
      :desc => "Desc"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc/)
  end
end
