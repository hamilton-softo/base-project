# frozen_string_literal: true

# Exemple class
class HealthcheckController < ApplicationController
  def index
    render json: { message: "Base Project API Versão 1.0 #{Time.now.localtime}" }, status: :ok
  end
end
