require 'rails_helper'

RSpec.describe "classrooms/new", type: :view do
  before(:each) do
    assign(:classroom, FactoryGirl.build(:classroom))
    assign(:students, Student.all)
    assign(:courses, Course.all)
  end

  it "renders new classroom form" do
    render

    assert_select "form[action=?][method=?]", classrooms_path, "post" do

      assert_select "select#classroom_student_id[name=?]", "classroom[student_id]"

      assert_select "select#classroom_course_id[name=?]", "classroom[course_id]"
    end
  end
end
