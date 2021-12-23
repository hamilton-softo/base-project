class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def create
    @person = Person.create!(person_params)
    render 'people/show', status: 201
  end

  def show
    @person = Person.find(params[:id])
  end

  def destroy
    Person.destroy(params[:id])
    head 204
  end

  private

  def person_params
    params.require(:person).permit(:name, :cpf, :email, :birthday, :active)
  end
end
