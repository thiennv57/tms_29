RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = "defined"
end

RSpec.describe Course, type: :model do
  context "has none to begin with" do
    it {expect(Course.count).to eq 0}
  end

  context "has one after adding one" do
    before {FactoryGirl.create :course}
    it {expect(Course.count).to eq 1}
  end

  after(:all) {Course.destroy_all}
  
  context "is valid with a name, description and day_work" do
    subject {FactoryGirl.create :course}
    it {expect(subject).to be_valid}
  end
  
  context "is invalid without a name" do
    subject {FactoryGirl.build :invalid_name_course}
    it {expect(subject).not_to be_valid}
  end

  context "is invalid without a description" do
    subject {FactoryGirl.build :invalid_description_course}
    it {expect(subject).not_to be_valid}
  end

  context "is invalid without a day_work" do
    subject {FactoryGirl.build :invalid_day_work_course}
    it {expect(subject).not_to be_valid}
  end

  context "is actived course" do
    let!(:course1) {FactoryGirl.create :course}
    let!(:course2) {FactoryGirl.create :course}
    let!(:course3) {FactoryGirl.create :actived_course}
    it {expect(Course.active_course.size).to eq 1}
  end

  context "association" do
    it {expect have_many :course_subjects}
    it {expect have_many(:subjects).through :course_subjects}
    it {expect have_many :user_courses}
    it {expect have_many(:users).through :user_courses}
  end
end
