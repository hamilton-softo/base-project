# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show update destroy]

  def index
    @people = Person.all
  end

  def show; end

  def create
    @person = Person.new(person_params)

    if @person.save
      render :show, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)
      render :show, status: :ok, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :cpf, :email, :address, :birthday, :active)
  end
end
