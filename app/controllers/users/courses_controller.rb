class Users::CoursesController < Users::UserController
  load_and_authorize_resource find_by: :slug
  before_action :set_course, only: [:show, :edit, :update, :destroy, :approve, :reject]

  def index
    if current_user.has_role?(:admin)
      @state = params[:state] || 'draft'
      @courses = Course.includes(:user).where(state: @state)
    elsif current_user.has_role?(:teacher)
      @courses = current_user.courses.all
    else
      @courses = Course.includes(:user).where(state: 'approved')
    end
  end

  # GET /teachers/courses/1
  def show; end

  # GET /teachers/courses/new
  def new
    @course = current_user.courses.new
  end

  # GET /teachers/courses/1/edit
  def edit; end

  # POST /teachers/courses
  def create
    user_id = params[:course][:user_id] || current_user.id
    @course = Course.new(course_params.merge(user_id: user_id))

    if @course.save
      redirect_to users_course_url(@course), notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /teachers/courses/1
  def update
    if @course.update(course_params)
      redirect_to users_course_url(@course), notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /teachers/courses/1
  def destroy
    @course.destroy
    redirect_to users_courses_url, notice: 'Course was successfully destroyed.'
  end

  # GET /admins/courses/1/approve
  def approve
    @course.course_approved!
    redirect_to users_courses_path, notice: "Course is approved."
  end

  # GET /admins/courses/1/reject
  def reject
    @course.course_rejected!
    redirect_to users_courses_path, notice: "Course is rejected."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.require(:course).permit(:title, :length_of_students, :start_datetime, :end_datetime, :content, :user_id)
  end
end