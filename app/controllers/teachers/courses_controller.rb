class Teachers::CoursesController < Teachers::TeacherController
  before_action :set_teachers_course, only: %i[show edit update destroy]

  # GET /teachers/courses
  def index
    @teachers_courses = current_user.courses.all
  end

  # GET /teachers/courses/1
  def show; end

  # GET /teachers/courses/new
  def new
    @teachers_course = current_user.courses.new
  end

  # GET /teachers/courses/1/edit
  def edit; end

  # POST /teachers/courses
  def create
    @teachers_course = current_user.courses.new(teachers_course_params)

    if @teachers_course.save
      redirect_to teachers_course_url(@teachers_course), notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /teachers/courses/1
  def update
    if @teachers_course.update(teachers_course_params)
      redirect_to teachers_course_url(@teachers_course), notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /teachers/courses/1
  def destroy
    @teachers_course.destroy
    redirect_to teachers_courses_url, notice: 'Course was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_teachers_course
    @teachers_course = current_user.courses.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def teachers_course_params
    params.require(:course).permit(:title, :length_of_students, :start_datetime, :end_datetime, :content)
  end
end
