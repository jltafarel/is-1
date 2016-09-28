FactoryGirl.define do
  factory :classroom do
    association :course
    association(:student)
    entry_at Time.now
  end
  factory :invalid_classroom, class: Classroom do
    course_id ''
    student_id ''
    entry_at nil
  end
end
