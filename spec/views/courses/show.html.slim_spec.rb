require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, FactoryGirl.create(:course))
  end

  it "renders attributes in <p>" do
    render
    course = FactoryGirl.build(:course)
    expect(rendered).to match(course.name)
    expect(rendered).to match(course.description)
    expect(rendered).to match(course.status_humanize)
  end
end
