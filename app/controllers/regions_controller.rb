class RegionsController < ApplicationController

  def index
    @regions = Region.paginate(page: params[:page], per_page: 5)

    @regions.each do |region|
      next if region.cities.length.zero?

      city_list = region.cities.inject('') { |lst, p| "#{lst}#{p.name}, " }
      city_list.chomp!(', ')

      region.del_confirm = "Some cities will be deleted: #{city_list}"
    end
  end

  def new
    @region = Region.new
  end

  def show
    @region = Region.find(params[:id])
    @city = City.new
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
      render 'new', status: :unprocessable_entity
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
    res = params.require(:region).permit(:name, :country_id)
    params[:country_id].nil? ? res : res.merge!({ country_id: params[:country_id] }) #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  end



end
