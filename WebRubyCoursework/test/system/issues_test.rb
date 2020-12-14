require "application_system_test_case"

class IssuesTest < ApplicationSystemTestCase
  setup do
    @issue = issues(:one)
  end

  test "visiting the index" do
    visit issues_url
    assert_selector "h1", text: "Issues"
  end

  test "creating a Issue" do
    visit issues_url
    click_on "New Issue"

    check "Closed" if @issue.closed
    fill_in "Email", with: @issue.email
    fill_in "Message", with: @issue.message
    fill_in "Name", with: @issue.name
    fill_in "Telephone", with: @issue.telephone
    click_on "Create Issue"

    assert_text "Issue was successfully created"
    click_on "Back"
  end

  test "updating a Issue" do
    visit issues_url
    click_on "Edit", match: :first

    check "Closed" if @issue.closed
    fill_in "Email", with: @issue.email
    fill_in "Message", with: @issue.message
    fill_in "Name", with: @issue.name
    fill_in "Telephone", with: @issue.telephone
    click_on "Update Issue"

    assert_text "Issue was successfully updated"
    click_on "Back"
  end

  test "destroying a Issue" do
    visit issues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Issue was successfully destroyed"
  end
end
