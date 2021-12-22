class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def destroy
    Person.destroy(params[:id])
    head 204
  end
end
