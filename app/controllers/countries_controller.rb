class CountriesController < ApplicationController

  def index
    @countries = Country.all
    @countries.each do |country|
      next if country.regions.length.zero

      reg_list = country.regions.inject('') { |lst, p| "#{lst}#{p.name}, " }
      reg_list.chomp!(', ')

      country.del_confirm = "Some regions will be deleted: #{reg_list}"
    end

  end

  def new
    @country = Country.new
  end

  def show
    @country = Country.find(params[:id])
    @region = Region.new
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])

    if @country.update(country_params)
      redirect_to action: :show
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    redirect_to countries_path
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to countries_path
    else
      render 'new'
    end
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end

end

