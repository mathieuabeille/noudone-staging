require "application_system_test_case"

class ChecklistsTest < ApplicationSystemTestCase
  setup do
    @checklist = checklists(:one)
  end

  test "visiting the index" do
    visit checklists_url
    assert_selector "h1", text: "Checklists"
  end

  test "creating a Checklist" do
    visit checklists_url
    click_on "New Checklist"

    check "Answer" if @checklist.answer
    fill_in "Flow", with: @checklist.flow_id
    fill_in "Taskline", with: @checklist.taskline
    fill_in "User", with: @checklist.user_id
    click_on "Create Checklist"

    assert_text "Checklist was successfully created"
    click_on "Back"
  end

  test "updating a Checklist" do
    visit checklists_url
    click_on "Edit", match: :first

    check "Answer" if @checklist.answer
    fill_in "Flow", with: @checklist.flow_id
    fill_in "Taskline", with: @checklist.taskline
    fill_in "User", with: @checklist.user_id
    click_on "Update Checklist"

    assert_text "Checklist was successfully updated"
    click_on "Back"
  end

  test "destroying a Checklist" do
    visit checklists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checklist was successfully destroyed"
  end
end
