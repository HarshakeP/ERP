class Admin::CoursesController < Admin::BaseController
    def index
        @courses = Course.all
    end

    def show
      @course = Course.find_by(id: params[:id])
    end

    def new
      @course = Course.new
    end

    def create
      @course = Course.new(course_params)
      if @course.save
        redirect_to admin_courses_path
      else
        render :new
      end
    end

    def edit
      @course = Course.find_by(id: params[:id])
    end

    def update
      @course = Course.find_by(id: params[:id])
      if @course.update(course_params)
        redirect_to admin_courses_path
      end
    end

    def destroy
      course = Course.find_by(id: params[:id])
      if course.destroy
        redirect_to admin_courses_path
      end
    end

    protected

    def course_params
      params.require(:course).permit(:title, :description, :price)
    end
  end