class LocalesController < ApplicationController
  def set_locale
    session[:locale] = params[:id]
    redirect_back(fallback_location: root_path)
  end
end
