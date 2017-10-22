class PagesController < ApplicationController

  before_action :create_cookie, only: [:show]

  def show
    render template: "pages/#{params[:page]}"
  end

end
