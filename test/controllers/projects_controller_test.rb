require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  
  def setup 
    @user       = users(:michael)
    @other_user = users(:archer)
    @project = Project.create(name: "test", desc: "this is a project")
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    project = Project.new(name: "test", url: "test.com", desc: "example text")
    project.save
    assert project.valid?
  end

  test "should not create project" do
    post projects_path(), params: {
                                    project: { name: "test",
                                               url: "test.com",
                                               desc: "example" } }
    assert_redirected_to login_url
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_project_url(@project)
    assert_response :success
  end

  test "should redirect to root if not loged in" do
    get edit_project_url(@project)
    assert_redirected_to login_url
  end
  test "should update project" do

  end

  test "should destroy project" do
    counting = Project.all.count
    @project.destroy
    assert counting > Project.all.count
  end

end
