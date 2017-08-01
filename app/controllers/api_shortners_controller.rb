class ApiShortnersController < ApplicationController
  include ActionController::MimeResponds

  respond_to :html, :js

  def index
    @api_shortner = ApiShortner.new
    @shortners = ApiShortner.all
  end

  def create
    @api_shortner = ApiShortner.create(shortner_params)
  end

  private
  def shortner_params
    params.require(:api_shortner).permit(:input_url, :slug)
  end
end
