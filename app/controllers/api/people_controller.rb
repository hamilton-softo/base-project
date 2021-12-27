class Api::PeopleController < ApplicationController
  before_action :set_person, only: %i[show update destroy]

  def index
    @people = Person.all
    render json: { body: { data: @people } }, status: :ok
  end

  def create
    @person = Person.new(set_params)

    if @person.save
      render json: { body: { message: 'Person created!', person: @person, status: 201}}, status: :created
    else
      render json: { body: { message: 'Error', errors: @person.errors, status: 400 } }, status: :bad_request
    end
  end

  def show
    if @person.valid?
      render json: { body: { data: @person} }, status: :ok
    else
      render json: { body: { message: 'Person not found!', status: 404 } }, status: :not_found
    end
  end

  def update
    if @person.update(set_params)
      render json: { body: { message: 'Person updated!', person: @person, status: 200} }, status: :ok
    else
      render json: { body: { message: 'Error', errors: @person.errors, status: 400 } }, status: :bad_request
    end
  end

  def destroy
    render json: { body: { message: 'Person not found!', status: 404 } }, status: :not_found unless @person.valid?
    @person.destroy
    render json: {body: {} }, status: :no_content

    # if @person.update({ 'active': false })
    #   render json: { message: 'Error to remove a person', errors: @person.errors, status: 400 }, status: :bad_request
    # else
    #   render json: {}, status: :no_content
    # end
  end

  private

  def set_params
    params.require(:person).permit(:name, :cpf, :active, :birthday, :address, :email)
  end

  def set_person
    @person = Person.find(params[:id])
  end
end
