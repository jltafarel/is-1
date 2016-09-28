require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      FactoryGirl.create(:student),
      FactoryGirl.create(:student)
    ])
  end

  it "renders a list of students" do
    render
    student = FactoryGirl.build :student
    assert_select "tr>td", :text => student.name.to_s, :count => 2
    assert_select "tr>td", :text => student.register_number.to_s, :count => 2
    assert_select "tr>td", :text => student.status_humanize.to_s, :count => 2
  end
end
