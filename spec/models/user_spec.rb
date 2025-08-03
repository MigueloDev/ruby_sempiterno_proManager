require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end

    it "is not valid without an email" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end
  end

  describe "associations" do
    it "has many assigned tasks" do
      user = create(:user)
      task = create(:task, assigned_to: user)
      expect(user.assigned_tasks).to include(task)
    end

    it "has many created tasks" do
      user = create(:user)
      task = create(:task, created_by: user)
      expect(user.created_tasks).to include(task)
    end

  end

  describe "methods" do
    let(:user) { create(:user) }

    it "returns full name" do
      expect(user.full_name).to eq(user.name)
    end

    it "returns tasks count" do
      create(:task, assigned_to: user)
      create(:task, assigned_to: user)
      expect(user.tasks_count).to eq(2)
    end

    it "returns completed tasks count" do
      create(:task, assigned_to: user, status: "completed")
      create(:task, assigned_to: user, status: "pending")
      expect(user.completed_tasks_count).to eq(1)
    end

    it "returns completion percentage" do
      create(:task, assigned_to: user, status: "completed")
      create(:task, assigned_to: user, status: "pending")
      expect(user.completion_percentage).to eq(50.0)
    end
  end
end