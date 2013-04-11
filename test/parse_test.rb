require 'turn'
require 'test/unit'
require 'nslocalize'

class NSLocalizeParseTest < Test::Unit::TestCase
  def test_parse
    results = NSLocalize::Parse.content("UIAlertView showWithTitle:NSLocalizedString(@\"Oops...\", @\"Welcome view\") message:nil")

    assert_instance_of Array, results
    assert_instance_of MatchData, results[0]
    assert_equal "@\"Oops...\"", results[0][1]
    assert_equal "@\"Welcome view\"", results[0][2]
  end

  def test_nil_parse
    results = NSLocalize::Parse.content("UIAlertView showWithTitle:NSLocalizedString(@\"Oops...\", nil) message:nil")

    assert_instance_of Array, results
    assert_instance_of MatchData, results[0]
    assert_equal "@\"Oops...\"", results[0][1]
    assert_equal "nil", results[0][2]
  end

  def test_multiple_parse
    results = NSLocalize::Parse.content("UIAlertView showWithTitle:NSLocalizedString(@\"Oops...\", nil) message:NSLocalizedString(@\"Oops...\", @\"Welcome view\")")

    assert_instance_of Array, results
    assert_equal 2, results.count
    assert_instance_of MatchData, results[0]
    assert_equal "@\"Oops...\"", results[0][1]
    assert_equal "nil", results[0][2]
    assert_equal "@\"Oops...\"", results[1][1]
    assert_equal "@\"Welcome view\"", results[1][2]
  end

  def test_file_parse
    results = NSLocalize::Parse.file('test/NSLocalize.m')

    assert_instance_of Array, results
    assert_equal 3, results.count
    assert_instance_of MatchData, results[0]
    assert_equal "@\"Simple title\"", results[0][1]
    assert_equal "nil", results[0][2]
    assert_equal "@\"Complex message with %@ \\/\"", results[1][1]
    assert_equal "@\"Group title\"", results[1][2]
    assert_equal "@\"OK\"", results[2][1]
    assert_equal "@\"Group title\"", results[2][2]
  end

  def test_project_parse
    results = NSLocalize::Parse.project('test/')

    assert_instance_of Array, results
    assert_equal 1, results.count
    assert_instance_of File, results[0][:file]
    assert_equal '.m', File.extname(results[0][:file].path)
    assert_instance_of Array, results[0][:strings]
    assert_equal 3, results[0][:strings].count
    assert_instance_of MatchData, results[0][:strings][0]
    assert_equal "@\"Simple title\"", results[0][:strings][0][1]
    assert_equal "nil", results[0][:strings][0][2]
    assert_equal "@\"Complex message with %@ \\/\"", results[0][:strings][1][1]
    assert_equal "@\"Group title\"", results[0][:strings][1][2]
    assert_equal "@\"OK\"", results[0][:strings][2][1]
    assert_equal "@\"Group title\"", results[0][:strings][2][2]
  end
end
