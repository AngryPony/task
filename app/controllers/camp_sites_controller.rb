class CampSitesController < ApplicationController

  def index
    @campsites = Campsite.all
  end

  def new
    @campsite = Campsite.new
  end

  def show
    @campsite = Campsite.find(params[:id])
  end

  def edit
    @campsite = Campsite.find(params[:id])
  end

  def destroy
    @campsite = Campsite.find(params[:id])
    @campsite.destroy
    redirect_to camp_sites_path
  end

  def create
    @campsite = Campsite.new(campsite_params)

    if @campsite.save
      redirect_to ca, camp_sites_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @campsite = Campsite.find(params[:id])

    if @campsite.update(campsite_params)
      redirect_to action: :show
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def campsite_params
    params.require(:region).permit(:name, :region_id)
  end
end

