class PrefsController < ApplicationController
  def show
    @pref = Pref.find_by_name_alnum(params[:pref])
    raise NotFoundException unless @pref


  end
end
