require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) {
    FactoryGirl.create :student
  }
  it 'should be created' do
    expect(student).to be_valid
  end
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:register_number)}
  it {should validate_uniqueness_of(:register_number)}
  it {should validate_presence_of(:status)}
end
