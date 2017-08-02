class ApiShortnersController < ApplicationController
  include ActionController::MimeResponds
  before_action :set_url, only: [:show]

  # response will be given in the form of html and js only
  respond_to :html, :js

  # Retrives the all the url's with number of clicks in desending order
  def index
    @api_shortner = ApiShortner.new
    @shortners = ApiShortner.all.order("num_of_clicks DESC")
  end

  # create the new url shorner based on the params
  def create
    @api_shortner = ApiShortner.create(shortner_params)
  end

  # create the new url shorner based on the params
  def show
    if redirect_to @api_shortner.first.input_url
        @api_shortner.first.num_of_clicks = 0 if @api_shortner.first.num_of_clicks.nil?
        @api_shortner.first.num_of_clicks += 1
        @api_shortner.first.save
      end
  end

  # private methods for params and setting the url shortner
  private
  def shortner_params
    params.require(:api_shortner).permit(:input_url, :slug, :num_of_clicks)
  end

  def set_url
    @api_shortner = ApiShortner.where(slug: params[:id])
  end
end
