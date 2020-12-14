require 'test_helper'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue = issues(:one)
  end

  test "should get index" do
    get issues_url
    assert_response :found
  end

  test "should get new" do
    get new_issue_url
    assert_response :success
  end

  test "should create issue" do
    assert_difference('Issue.count') do
      post issues_url, params: { issue: { closed: @issue.closed, email: @issue.email, message: @issue.message, name: @issue.name, telephone: @issue.telephone } }
    end

    assert_redirected_to issue_url(Issue.last)
  end

  test "should show issue" do
    get issue_url(@issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_issue_url(@issue)
    assert_response :success
  end

  test "should update issue" do
    patch issue_url(@issue), params: { issue: { closed: @issue.closed, email: @issue.email, message: @issue.message, name: @issue.name, telephone: @issue.telephone } }
    assert_redirected_to issues_url
  end

  test "should create valid issue" do
    issue = Issue.new

    issue.name = "test"
    issue.email = "test"
    issue.message = "test"
    issue.closed = true

    issue.save

    assert issue.valid?
  end

  test "should not create valid issue" do
    issue = Issue.new

    issue.save

    refute issue.valid?
  end
end
