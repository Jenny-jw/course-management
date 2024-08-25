require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      course = Course.new(course_name: 'Math 101', teacher_name: "abc", course_description: 'Basic Mathematics')
      expect(course).to be_valid
    end

    it 'is not valid without a course_name' do
      course = Course.new(course_name: nil, teacher_name: "abc", course_description: 'Basic Mathematics')
      expect(course).not_to be_valid
    end

    it 'is not valid without a course_description' do
      course = Course.new(course_name: 'Math 101', teacher_name: "abc", course_description: nil)
      expect(course).to be_valid
    end
  end
end
