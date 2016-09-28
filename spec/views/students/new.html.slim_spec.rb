require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, FactoryGirl.create(:student))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input#student_name[name=?]", "student[name]"

      assert_select "input#student_register_number[name=?]", "student[register_number]"

      assert_select "select#student_status[name=?]", "student[status]"
    end
  end
end
