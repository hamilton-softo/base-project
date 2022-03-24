# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'nome teste',
                     cpf: '12345678910',
                     email: 'teste@teste.com',
                     address: 'rua teste',
                     birthday: '2022-03-23',
                     active: true)
  end

  describe 'quando o nome não foi informado' do
    before { @user.name = '' }
    it { should_not be_valid }
  end

  describe 'quando o cpf já está sendo usado' do
    before do
      cpf_with_same_numbers = @user.dup
      cpf_with_same_numbers.cpf = @user.cpf
      cpf_with_same_numbers.save
    end

    it { should_not be_valid }
  end

  describe 'quando o cpf não foi informado' do
    before { @user.cpf = '' }
    it { should_not be_valid }
  end

  describe 'quando o cpf não tem 11 elementos' do
    before { @user.cpf = '12345' }
    it { should_not be_valid }
  end

  describe 'quando o cpf não tem somento numeros' do
    before { @user.cpf = '1234567ia10' }
    it { should_not be_valid }
  end

  describe 'quando o status não foi informado' do
    before { @user.active = '' }
    it { should_not be_valid }
  end

  describe 'quando o email não esta no formato certo' do
    before { @user.email = 'testeemail' }
    it { should_not be_valid }
  end
end
