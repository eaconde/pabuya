class Admin::UserEventSubmissionsController < AdminController
  before_action :set_user_event_submission, only: [:show, :edit, :update, :destroy]

  # GET /user_event_submissions
  # GET /user_event_submissions.json
  def index
    @user_event_submissions = UserEventSubmission.all
  end

  # GET /user_event_submissions/1
  # GET /user_event_submissions/1.json
  def show
  end

  # GET /user_event_submissions/new
  def new
    @user_event_submission = UserEventSubmission.new
  end

  # GET /user_event_submissions/1/edit
  def edit
  end

  # POST /user_event_submissions
  # POST /user_event_submissions.json
  def create
    @user_event_submission = UserEventSubmission.new(user_event_submission_params)

    respond_to do |format|
      if @user_event_submission.save
        format.html { redirect_to admin_user_event_submissions_url, notice: 'User event submission was successfully created.' }
        format.json { render :show, status: :created, location: @user_event_submission }
      else
        format.html { render :new }
        format.json { render json: @user_event_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_event_submissions/1
  # PATCH/PUT /user_event_submissions/1.json
  def update
    respond_to do |format|
      if @user_event_submission.update(user_event_submission_params)
        format.html { redirect_to admin_user_event_submissions_url, notice: 'User event submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_event_submission }
      else
        format.html { render :edit }
        format.json { render json: @user_event_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_event_submissions/1
  # DELETE /user_event_submissions/1.json
  def destroy
    @user_event_submission.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_event_submissions_url, notice: 'User event submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_event_submission
      @user_event_submission = UserEventSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_event_submission_params
      params.require(:user_event_submission)
            .permit(:user_id, :event_id, :attachment, :status, :points, :notes)
    end
end
