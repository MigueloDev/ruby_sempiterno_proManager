require "rails_helper"

RSpec.describe Task, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      task = build(:task)
      expect(task).to be_valid
    end

    it "is not valid without a title" do
      task = build(:task, title: nil)
      expect(task).not_to be_valid
    end

    it "is not valid without a status" do
      task = build(:task, status: nil)
      expect(task).not_to be_valid
    end
  end

  describe "associations" do
    it "belongs to project" do
      project = create(:project)
      task = create(:task, project: project)
      expect(task.project).to eq(project)
    end

    it "belongs to assigned_to" do
      user = create(:user)
      task = create(:task, assigned_to: user)
      expect(task.assigned_to).to eq(user)
    end

  end

  describe "scopes" do
    it "returns pending tasks" do
      pending_task = create(:task, status: "pending")
      create(:task, status: "completed")
      expect(Task.pending).to include(pending_task)
    end

    it "returns completed tasks" do
      completed_task = create(:task, status: "completed")
      create(:task, status: "pending")
      expect(Task.completed).to include(completed_task)
    end
  end

  describe "methods" do
    let(:task) { create(:task) }

    it "returns completed status" do
      completed_task = create(:task, status: "completed")
      expect(completed_task.completed?).to be true
      expect(task.completed?).to be false
    end

    it "returns pending status" do
      expect(task.pending?).to be true
    end

    it "marks as completed" do
      task.mark_as_completed
      expect(task.completed?).to be true
    end

    it "returns status label" do
      expect(task.status_label).to eq("Pendiente")
    end
  end
end