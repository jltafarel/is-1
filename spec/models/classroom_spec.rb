require 'rails_helper'

RSpec.describe Classroom, type: :model do

  let(:classroom) {
    FactoryGirl.create :classroom
  }

  it 'should be created' do
    expect(classroom).to be_valid
  end

  it {should validate_presence_of(:entry_at)}
  it {should belong_to(:student)}
  it {should belong_to(:course)}
end
