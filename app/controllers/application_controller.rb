class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_common_values

  private
  def load_common_values
    @common = {
      prefs: Pref.scoped.all
    }
  end
end
