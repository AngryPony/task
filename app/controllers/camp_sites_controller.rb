class CampSitesController < ApplicationController

  def index
    @campsites = Campsite.paginate(page: params[:page], per_page: 8)
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
      redirect_to camp_sites_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @campsite = Campsite.find(params[:id])

    if @campsite.update(campsite_params)
      redirect_to camp_site_path(@campsite)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private


  def campsite_params
    res = params.require(:campsite).permit(:name, :city_id, :region_id)
    params[:city_id].nil? ? res : res.merge!({ city_id: params[:city_id], region_id: City.find(params[:city_id]).region_id })
  end

end

