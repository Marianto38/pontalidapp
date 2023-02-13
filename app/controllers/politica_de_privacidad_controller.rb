class PoliticaDePrivacidadController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :eliminar_usuarios, :condiciones ]
  def index
  end

  def eliminar_usuarios
  end

  def condiciones
  end
end
