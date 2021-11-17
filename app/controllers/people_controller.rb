class PeopleController < BaseController

  def initialize;end

  def index
    @people = Person.all.order(id: :asc)
    render :index, status: :ok
  end

  def show
    @person = Person.find_by_id(params[:id])
    if !@person.nil?
      render :show, status: :ok
    else
      @message =  "No one person was found"
      render :message, status: :ok
    end
  end

  def create
    @person = Person.new(person_params)
    if !CPF.valid?(@person.cpf)
      @message = "CPF é inválido"
      render :message, status: :bad_request and return
    end
    if @person.valid?
      @person.save
      render :show, status: :ok
    else
      @message = @person.errors.full_messages
      render :message, status: :bad_request           
    end 
  end

  def update
    @person = Person.find_by_id(params[:id])
    if( !person_params[:cpf].nil? && !CPF.valid?(person_params[:cpf]))
      render json: {message:"CPF é inválido"}, status: :bad_request and return
    end
    @person.update(person_params)
    if @person.valid?
      render :show, status: :ok
    else
      @message = @person.errors.full_messages
      render :message, status: :bad_request
    end
  end

  def destroy
    person = Person.find_by_id(params[:id])
    if !person.nil? && person.delete
      @message = "Person Deleted with success!"
      render  :message, status: :ok
    else
      @message = "Person can not be deleted because or person is nil or person not exists!"
      render :message, status: :ok
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :cpf, :email, :address, :birthday, :active )
  end
end