require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
  	@project = Project.new(name: "Exemple site", url: "http://exemple.com", desc: "Exemple text of the website")
  end

  test "should be valid" do
  	assert @project.valid?
  end

  test "name should be present" do
  	@project.name = "    "
  	assert_not @project.valid?
  end


end
