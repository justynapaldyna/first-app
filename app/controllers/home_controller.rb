class HomeController < ApplicationController
  def create
  end
  def new
  end
  def edit
  end
  def show
    @id =params[:id]
  end
  def index
    @message = 'Cześć'

  end
  def update
  end
  def destroy
  end
end
