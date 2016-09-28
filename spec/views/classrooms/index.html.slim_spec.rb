require 'rails_helper'

RSpec.describe "classrooms/index", type: :view do
  before(:each) do
    assign(:classrooms, [
      FactoryGirl.create(:classroom, student: FactoryGirl.create(:student, register_number: '000008')),
      FactoryGirl.create(:classroom, student: FactoryGirl.create(:student, register_number: '000009'))
    ])
  end

  it "renders a list of classrooms" do
    render
    classroom = FactoryGirl.build :classroom
    assert_select "tr>td", :text =>classroom.student.name.to_s, :count => 2
    assert_select "tr>td", :text =>classroom.course.name.to_s, :count => 2
  end
end
