class JobController < ApplicationController
  before_action :find_job, only: [:edit, :update, :delete]

  def index
    @jobs = Job.where( "user_id IS ? AND deleted IS ?", current_user.id, false )
  end

  def new
    @job = Job.new
  end

  def create
    Job.create!(params[:job])
  end

  def edit
  end

  def update
    @job.update(params[:job])
  end

  def delete
    Job.update()
  end

  private
    def find_job
      @job = Job.find(params[:id])
    end

end
