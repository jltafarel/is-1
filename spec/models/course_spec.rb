require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = FactoryGirl.build(:course)
  end
  it 'should be created' do
    expect(@course).to be_valid
  end
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:status)}
end
