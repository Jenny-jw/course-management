require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'associations' do
    it { should belong_to(:course) }
    it { should have_db_column(:unit_name).of_type(:string) }
    it { should have_db_column(:unit_description).of_type(:text) }
    it { should have_db_column(:unit_content).of_type(:text) }
    it { should have_db_column(:course_id).of_type(:integer) }
    it { should have_db_column(:position).of_type(:integer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:unit_name) }
    it { should validate_length_of(:unit_name).is_at_most(50) }
    it { should allow_value('Valid Unit Name').for(:unit_name) }
    it { should_not allow_value('Invalid Unit Name!@#').for(:unit_name) }

    it { should validate_presence_of(:unit_content) }
    it { should validate_length_of(:unit_content).is_at_most(500) }
    it { should allow_value('Valid content.').for(:unit_content) }
    it { should_not allow_value('Invalid content!@#').for(:unit_content) }

    it { should validate_length_of(:unit_description).is_at_most(500) }
    it { should allow_value('Valid description.').for(:unit_description) }
    it { should_not allow_value('Invalid description!@#').for(:unit_description) }
  end

  describe 'database columns' do
    it 'has a unit_name column' do
      should have_db_column(:unit_name).of_type(:string)
    end

    it 'has a unit_description column' do
      should have_db_column(:unit_description).of_type(:text)
    end

    it 'has a unit_content column' do
      should have_db_column(:unit_content).of_type(:text)
    end

    it 'has a course_id column' do
      should have_db_column(:course_id).of_type(:integer)
    end

    it 'has a position column' do
      should have_db_column(:position).of_type(:integer)
    end
  end

  describe 'act_as_list' do
    it 'uses acts_as_list to manage position within the scope of course' do
      course = Course.create!(course_name: 'Geography', teacher_name: 'Dr Watson')
      unit1 = course.units.create!(unit_name: 'Unit 1', unit_content: 'Content A', position: 2)
      unit2 = course.units.create!(unit_name: 'Unit 2', unit_content: 'Content B', position: 1)
      
      expect(course.units).to eq([unit2, unit1])
    end
  end
end
