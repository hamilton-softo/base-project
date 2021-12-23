class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show update ]

  def index
    @people = Person.order(:id).page params[:page]
  end

  def create
    @person = Person.create!(person_params)

    render 'people/show', status: 201
  end

  def update
    @person.update!(person_params)

    render 'people/show', status: 200
  end

  def show
  end

  def destroy
    Person.destroy(params[:id])

    head 204
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :cpf, :email, :birthday, :address, :active)
  end
end
