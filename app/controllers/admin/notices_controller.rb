  class Admin::NoticesController < Admin::BaseController
  def index
    @notices = Notice.all
  end

  def show
    @notice = notice    
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      StatusMailer.with(notice: @notice).new_status_mail.deliver_now
      redirect_to [:admin, @notice]
    else
      render :new
    end
  end

  def edit
    @notice = notice
  end

  def update
    @notice = notice
    if @notice.update(notice_params)
      redirect_to [:admin, @notice]
    else
      render :new
    end
  end

  def destroy
    @notice = notice

    if @notice.destroy
      redirect_to admin_dashboard_index_path
    else
      redirect_to [:admin, @notice]
    end
  end

  protected

  def notice
    Notice.find_by(id: params[:id])
  end

  def notice_params  
    params.require(:notice).permit(:subject, :description)
  end
end