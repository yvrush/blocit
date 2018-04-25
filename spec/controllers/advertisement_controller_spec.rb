require 'rails_helper'
include RandomData

RSpec.describe AdvertisementController, type: :controller do

  let (:my_ad) { Advertisement.create(
      id: 1,
      title:    RandomData.random_sentence,
      copy:  RandomData.random_paragraph,
      price:  99
    )}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_ad] to @advertisement" do
      get :index
      expect(assigns(:advertisement)).to eq([my_ad])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show,  {id: my_ad.id}
      expect(response).to render_template :show
    end
    it "assigns [my_ad] to @advertisement" do
      get :show, {id: my_ad.id}
      expect(assigns(:advertisement)).to eq(my_ad)
    end
end




end
