require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, FactoryGirl.create(:course))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input#course_name[name=?]", "course[name]"

      assert_select "input#course_description[name=?]", "course[description]"

      assert_select "select#course_status[name=?]", "course[status]"
    end
  end
end
