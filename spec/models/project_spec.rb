require "rails_helper"

RSpec.describe Project, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      project = build(:project)
      expect(project).to be_valid
    end

    it "is not valid without a name" do
      project = build(:project, name: nil)
      expect(project).not_to be_valid
    end

    it "is not valid without a status" do
      project = build(:project, status: nil)
      expect(project).not_to be_valid
    end
  end

  describe "associations" do
    it "has many tasks" do
      project = create(:project)
      task = create(:task, project: project)
      expect(project.tasks).to include(task)
    end
  end

  describe "scopes" do
    it "returns active projects" do
      active_project = create(:project, status: "active")
      create(:project, status: "completed")
      expect(Project.active).to include(active_project)
    end

    it "returns completed projects" do
      completed_project = create(:project, status: "completed")
      create(:project, status: "active")
      expect(Project.completed).to include(completed_project)
    end
  end

  describe "methods" do
    let(:project) { create(:project) }

    it "returns tasks count" do
      create(:task, project: project)
      create(:task, project: project)
      expect(project.tasks_count).to eq(2)
    end

    it "returns completion percentage" do
      create(:task, project: project, status: "completed")
      create(:task, project: project, status: "pending")
      expect(project.completion_percentage).to eq(50.0)
    end

  end
end