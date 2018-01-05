require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = Project.create(name: "test", desc: "this is a project")
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    project = Project.new(name: "test", desc: "this is a project")
    project.save

    assert project.valid?
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do

  end

  test "should destroy project" do
    counting = Project.all.count
    @project.destroy
    assert counting > Project.all.count
  end
end
