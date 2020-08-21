class Users::EnrollmentsController < Users::UserController
  load_and_authorize_resource
  before_action :set_users_enrollment, only: %i[show edit update destroy approve reject]

  # GET /users/enrollments
  def index
    @enrollments = if current_user.has_role?(:admin)
                     Enrollment.includes(:user, :course).all
                   elsif current_user.has_role?(:teacher)
                     Enrollment.includes(:user, :course).where(course_id: current_user.courses.pluck(:id)).all
                   else
                     current_user.enrollments.includes([:course]).all
                   end
  end

  # GET /users/enrollments/1
  def show; end

  # GET /users/enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /users/enrollments/1/edit
  def edit; end

  # POST /users/enrollments
  def create
    @enrollment = if current_user.has_role?(:admin)
                    Enrollment.new(enrollment_params)
                  else
                    current_user.enrollments.new(enrollment_params)
                  end

    if @enrollment.save
      redirect_to users_enrollment_url(@enrollment), notice: 'Enrollment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/enrollments/1
  def update
    if @enrollment.update(enrollment_params)
      redirect_to users_enrollment_url(@enrollment), notice: 'Enrollment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/enrollments/1
  def destroy
    @enrollment.discard
    redirect_to users_enrollments_url, notice: 'Enrollment was successfully destroyed.'
  end

  # GET /admins/courses/1/approve
  def approve
    @enrollment.enrollment_approved!
    redirect_to users_enrollments_url, notice: 'Enrollment was successfully approved.'
  end

  # GET /admins/courses/1/reject
  def reject
    @enrollment.enrollment_rejected!
    redirect_to users_enrollments_url, notice: 'Enrollment was successfully rejected.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users_enrollment
    @enrollment = if current_user.has_role?(:admin)
                    Enrollment.includes(:user, :course).find(params[:id])
                  elsif current_user.has_role?(:teacher)
                    Enrollment.includes(:user, :course).where(course_id: current_user.courses.pluck(:id)).find(params[:id])
                  else
                    current_user.enrollments.find(params[:id])
                  end
  end

  # Only allow a trusted parameter "white list" through.
  def enrollment_params
    params.require(:enrollment).permit(:course_id, :user_id)
  end
end
