require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:units).order(:position).dependent(:destroy) }

    it 'destroys associated units when course is destroyed' do
      course = Course.create!(course_name: 'Geography', teacher_name: 'Dr Watson')
      course.units.create!(unit_name: 'First Unit', unit_content: 'Content A')
      expect { course.destroy }.to change(Unit, :count).by(-1)
    end

    it 'orders units by position' do
      course = Course.create!(course_name: 'Geography', teacher_name: 'Dr Watson')
      unit1 = course.units.create!(unit_name: 'Second Unit', unit_content: 'Content B', position: 2)
      unit2 = course.units.create!(unit_name: 'First Unit', unit_content: 'Content A', position: 1)

      expect(course.units).to eq([unit2, unit1])
    end
  end

  describe 'validations' do
    let(:valid_attributes) do
      {
        course_name: 'Geography',
        teacher_name: 'Dr Watson',
        course_description: 'Topographic map of the world.'
      }
    end

    let(:missing_course_name) { valid_attributes.except(:course_name) }
    let(:missing_teacher_name) { valid_attributes.except(:teacher_name) }
    let(:missing_both) { valid_attributes.except(:course_name, :teacher_name) }
    let(:long_course_name) { valid_attributes.merge(course_name: 'A' * 51) }
    let(:invalid_teacher_name) { valid_attributes.merge(teacher_name: 'Dr. Watson!') }

    it 'is valid with valid attributes' do
      expect(Course.new(valid_attributes)).to be_valid
    end

    it 'is invalid without a course_name' do
      expect(Course.new(missing_course_name)).not_to be_valid
    end

    it 'is invalid without a teacher_name' do
      expect(Course.new(missing_teacher_name)).not_to be_valid
    end

    it 'is invalid without both course_name and teacher_name' do
      expect(Course.new(missing_both)).not_to be_valid
    end

    it 'is invalid if course_name is too long' do
      expect(Course.new(long_course_name)).not_to be_valid
    end

    it 'is invalid if teacher_name contains invalid characters' do
      expect(Course.new(invalid_teacher_name)).not_to be_valid
    end
  end
end
