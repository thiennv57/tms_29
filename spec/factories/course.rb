FactoryGirl.define do
  factory :course do
    name {Faker::Name.name}
    description {Faker::Lorem.word}
    day_work {Faker::Number.digit}

    factory :invalid_name_course do
      name ""
    end

    factory :invalid_description_course do
      description ""
    end

    factory :invalid_day_work_course do
      day_work {Faker::Lorem.word}
    end

    factory :actived_course do
      active true
    end
  end
end
