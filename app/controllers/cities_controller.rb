class CitiesController < ApplicationController

  def index
    @cities = City.paginate(page: params[:page], per_page: 8)
  end

  def new
    @city = City.new
  end

  def show
    @city = City.find(params[:id])
    @camp_site = Campsite.new
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
    res = params.require(:city).permit(:name, :region_id)
    params[:region_id].nil? ? res : res.merge!({ region_id: params[:region_id] })
  end

end

