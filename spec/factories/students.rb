FactoryGirl.define do
  factory :student do
    name "Foo Bar"
    register_number '00001'
    status 0
  end
  factory :invalid_student, class: Student do
    name ""
    register_number ""
    status 0
  end
end
