class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def show
    @city = City.find(params[:id])
  end

  def edit
    @city = City.find(params[:id])
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to cities_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @city = City.find(params[:id])

    if @city.update(city_params)
      redirect_to action: :show
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, :region_id)
  end
end
