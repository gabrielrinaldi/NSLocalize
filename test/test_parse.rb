require 'helper'

class NSLocalizeParseTest < Test::Unit::TestCase
  context "a project" do
    setup do
      @project = NSLocalize::Parse.project(File.absolute_path(File.new('test/')))
    end

    should "be an Array" do
      assert_instance_of Array, @project
    end

    should "have only one valid file" do
      assert_equal 1, @project.count
      assert_instance_of File, @project[0][:file]
      assert_equal '.m', File.extname(@project[0][:file].path)
    end

    should "have 3 valid @project" do
      assert_instance_of Array, @project[0][:strings]
      assert_equal 3, @project[0][:strings].count
      assert_instance_of MatchData, @project[0][:strings][0]
    end

    should "find the correct strings in all cases" do
      assert_equal "@\"Simple title\"", @project[0][:strings][0][1]
      assert_equal "nil", @project[0][:strings][0][2]
      assert_equal "@\"Complex message with %@ \\/\"", @project[0][:strings][1][1]
      assert_equal "@\"Group title\"", @project[0][:strings][1][2]
      assert_equal "@\"OK\"", @project[0][:strings][2][1]
      assert_equal "@\"Group title\"", @project[0][:strings][2][2]
    end
  end
end
