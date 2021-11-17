class BaseController < ApplicationController

  def initialize
    raise "The Class can not be instantiated"
  end

  def show
    raise "This method can not be instantiated"
  end

  def create
    raise "This method must be implemented child class"
  end

  def update
    raise "This method must be implemented child class"
  end

  def destroy
    raise "This method must be implemented child class"
  end
end