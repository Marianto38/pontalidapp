class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :modo_oscuro ]

  def home
  end

  def modo_oscuro
  end
end
