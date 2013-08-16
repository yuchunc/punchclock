class JobController < ApplicationController
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
    Job.create(params[:job])
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
end
