require 'test_helper'

class UserEventSubmissionsControllerTest < ActionController::TestCase
  setup do
    @user_event_submission = user_event_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_event_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_event_submission" do
    assert_difference('UserEventSubmission.count') do
      post :create, user_event_submission: { event_id: @user_event_submission.event_id, user_id: @user_event_submission.user_id }
    end

    assert_redirected_to user_event_submission_path(assigns(:user_event_submission))
  end

  test "should show user_event_submission" do
    get :show, id: @user_event_submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_event_submission
    assert_response :success
  end

  test "should update user_event_submission" do
    patch :update, id: @user_event_submission, user_event_submission: { event_id: @user_event_submission.event_id, user_id: @user_event_submission.user_id }
    assert_redirected_to user_event_submission_path(assigns(:user_event_submission))
  end

  test "should destroy user_event_submission" do
    assert_difference('UserEventSubmission.count', -1) do
      delete :destroy, id: @user_event_submission
    end

    assert_redirected_to user_event_submissions_path
  end
end
