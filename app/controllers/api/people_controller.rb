module Api
  class PeopleController < ApplicationController
    before_action :set_person, only: [:show, :update, :destroy]

    def index
      render json: Person.all, status: :ok
    end

    def create
      @person = Person.new(set_params)

      unless @person.valid?
        render json: { message: "Error", errors: @person.errors.full_messages, status: 400 }, status: :bad_request
      end

      @person.save
      render json: { message: "Person created!", person: @person, status: 201 }, status: :created
    end

    def show
      if @person.nil?
        render json: { message: "Person not found!", status: 404 }, status: :not_found
      end
      render json: { person: @person }, status: :ok
    end

    def update
      unless @person.valid?
        render json: { message: "Error", errors: @person.errors.full_messages, status: 400 }, status: :bad_request
      end

      @person.update!(set_params)
      render json: { message: "Person updated!", person: @person, status: 200 }, status: :ok
    end

    def destroy
      if @person.nil?
        render json: { message: "Person not found!", status: 404 }, status: :not_found
      end

      @person.destroy
      render json: {}, status: :no_content
    end

    private

    def set_params
      params.require(:person).permit(:name, :cpf, :active, :birthday, :address, :email)
    end

    def set_person
      @person = Person.find(params[:id])
    end
  end
end
