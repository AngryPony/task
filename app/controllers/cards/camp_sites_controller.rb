class Cards::CampSitesController < CampSitesController

  def index
    @campsites = Campsite.all

    unless params[:country_id].nil?
      @country = Country.find(params[:country_id])
      @campsites = @country.campsites
    end

    unless params[:region_id].nil?
      @region = Region.find(params[:region_id])
      @campsites = @region.campsites
    end

    unless params[:city_id].nil?
      @city = City.find(params[:city_id])
      @campsites = @city.campsites
    end

    @countries = Country.all
    @regions = @country.nil? ? Region.all : @country.regions
    @cities = @region.nil? ? City.all : @region.cities
  end

  def search
    @campsites = Campsite.where("name LIKE ?","%" + params[:q] + "%")
  end


end
