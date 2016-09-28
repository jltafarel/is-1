FactoryGirl.define do
  factory :course do
    name "Sistemas de Informação"
    description "Este bacharel administra o fluxo de informações que circulam por redes de computadores dentro e fora de uma organização."
    status 0
  end
  factory :invalid_course, class: Course do
    name ''
    description ''
    status 0
  end
end
