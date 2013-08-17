class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :delete]

  def index
    @jobs = Job.where( user: @current_user, deleted: false )
  end

  def show
  end

  def new
    @job = Job.new
    @job.company = Company.new
  end

  def create
    Job.create(job_params)
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
      params.required(:job).permit(:name, :pay_per_hour,
                                   :hour_per_week, :started_date,
                                   :end_date, :company)
    end

    def company_params
      params.require(:company).permit(:name, :country, :city, :address )
    end
end
