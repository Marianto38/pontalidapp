class PoliticaDePrivacidadController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :eliminar_usuarios ]
  def index
  end

  def eliminar_usuarios
  end
end
