class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :delete]

  def index
    @jobs = Job.where( user: current_user, deleted: false )
  end

  def show
  end

  def new
    @job = Job.new
    @job.user = @current_user
    @job.company = Company.new
  end

  def create
    @job = Job.new(job_params)
    #@job.company ||= Company.new(company_params) if params[:job][:company][:name]
    @job.user = @current_user
    @current_user.update(current_job: @job) if params[:job][:current_job] == true
    if @job.save
      redirect_to jobs_path
    else
      @job.company = Company.new
      render :new, alert: "要輸入職務名稱喔!"
    end
  end

  def edit
  end

  def update
    @job.update(params[:job])
  end

  def deleted
    @job.update(deleted: true)
  end

  private

    def find_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.required(:job).permit(:name, :pay_per_hour, :hours_per_week, :start_date, :end_date,
                                   company_attributes: [:name, :country, :city, :url, :address, :phone, :postal_code]
                                  )
    end

    def company_params
      params.required(:job).required(:company).permit(:name, :country, :city, :url,
                                                      :address, :phone, :postal_code
                                                     )
    end

end
