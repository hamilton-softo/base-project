class PersonController < BaseController

  def initialize;end


	def index
		@people = Person.all.order(id: :asc)
		render json: @people, status: :ok
	end

	def show
		@person = Person.find_by_id(params[:id])
		if !@person.nil?
			render json: @person, status: :ok
		else
			render json: "No one person was found", status: :ok
		end
	end

	def create
		person = Person.new(person_params)
		if !CPF.valid?(person.cpf)
			render json: {message:"CPF é inválido"}, status: :bad_request and return
		end
		if person.valid?
			person.save
			render json: person, status: :ok
		else
			render json: person.errors.full_messages, status: :bad_request           
		end 
	end

  def update
		person = Person.find_by_id(params[:id])
		if( !person_params[:cpf].nil? && !CPF.valid?(person_params[:cpf]))
			render json: {message:"CPF é inválido"}, status: :bad_request and return
		end
		person.update(person_params)
		if person.valid?
			render json: person, status: :ok
		else
			render json: person.errors.full_messages, status: :bad_request
		end
	end

  def destroy
		person = Person.find_by_id(params[:id])
		if !person.nil? && person.delete
			render json: {message:"Person Deleted with success!"}, status: :ok
		else
			render json: {message: "Person can not be deleted because or person is nil or person not exists!"}, status: :ok
		end
	end


	private

	def person_params
		params.require(:person).permit(:name, :cpf, :email, :address, :birthday, :active )
	end
end