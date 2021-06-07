class RegionsController < ApplicationController

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def show
    @region = Region.find(params[:id])
  end

  def edit
    @region = Region.find(params[:id])
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    redirect_to regions_path
  end

  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to regions_path
    else
      render 'new'
    end
  end

  def update
    @region = Region.find(params[:id])

    if @region.update(region_params)
      redirect_to action: :show
    else
      render 'edit', status: :unprocessable_entity
    end
  end


  private

  def region_params
    params.require(:region).permit(:name, :country_id)
  end

end