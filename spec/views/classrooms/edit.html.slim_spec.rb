require 'rails_helper'

RSpec.describe "classrooms/edit", type: :view do
  before(:each) do
    @classroom = assign(:classroom, FactoryGirl.create(:classroom))
  end

  it "renders the edit classroom form" do
    render

    assert_select "form[action=?][method=?]", classroom_path(@classroom), "post" do

      assert_select "select#classroom_student_id[name=?]", "classroom[student_id]"

      assert_select "select#classroom_course_id[name=?]", "classroom[course_id]"
    end
  end
end
