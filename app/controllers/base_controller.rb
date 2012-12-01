class BaseController < ApplicationController
  def index
    @new_jobs = Job.new_jobs(20).page params[:page]
  end
end
