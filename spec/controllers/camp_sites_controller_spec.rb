require 'rails_helper'

RSpec.describe CampSitesController do

  #1
  describe 'GET index' do

    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'has renders index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  #2
  describe 'GET edit' do

    campsite = Campsite.all.first
    it 'has a 200 status code' do
      get :edit, params: { id: campsite.id }
      expect(response.status).to eq(200)
    end
    it 'has renders edit template' do
      get :edit, params: { id: campsite.id }
      expect(response).to render_template('edit')
    end
  end

  #3
  describe 'GET new' do

    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end
    it 'has renders edit template' do
      get :new
      expect(response).to render_template('new')
    end

  end

end