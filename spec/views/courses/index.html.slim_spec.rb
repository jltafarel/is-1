require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      FactoryGirl.create(:course),
      FactoryGirl.create(:course)
    ])
  end

  it "renders a list of courses" do
    render
    course = FactoryGirl.build(:course)
    assert_select "tr>td", :text => course.name.to_s, :count => 2
    assert_select "tr>td", :text => course.description.to_s, :count => 2
    assert_select "tr>td", :text => course.status_humanize.to_s, :count => 2
  end
end
