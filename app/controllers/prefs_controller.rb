class PrefsController < ApplicationController
  def show
    @pref = Pref.find_by_name_alnum(params[:pref].classify)
    raise NotFoundException unless @pref

    @jobs = Job.where(pref: @pref.name).page params[:page]
  end
end
