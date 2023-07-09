require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      task = FactoryBot.build(:task)
      expect(task).to be_valid
    end

    it 'is not valid without a description' do
      task = FactoryBot.build(:task, description: nil)
      expect(task).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      user = FactoryBot.create(:user)
      task = FactoryBot.create(:task, user: user)
      expect(task.user).to eq(user)
    end
  end

  describe 'default values' do
    it 'defaults completed attribute to false' do
      task = FactoryBot.create(:task)
      expect(task.completed).to be_falsey
    end
  end

  describe 'marking as completed' do
    it 'can be marked as completed' do
      task = FactoryBot.create(:task)
      task.update(completed: true)
      expect(task.completed).to be_truthy
    end

    it 'can be marked as uncompleted' do
      task = FactoryBot.create(:task, completed: true)
      task.update(completed: false)
      expect(task.completed).to be_falsey
    end
  end
end
