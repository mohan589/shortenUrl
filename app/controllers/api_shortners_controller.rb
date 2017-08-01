class ApiShortnersController < ApplicationController
  include ActionController::MimeResponds
  before_action :set_url, only: [:show]

  respond_to :html, :js

  def index
    @api_shortner = ApiShortner.new
    @shortners = ApiShortner.all
  end

  def create
    @api_shortner = ApiShortner.create(shortner_params)
  end

  def show
    redirect_to @api_shortner.first.input_url
  end

  private
  def shortner_params
    params.require(:api_shortner).permit(:input_url, :slug)
  end

  def set_url
    @api_shortner = ApiShortner.where(slug: params[:id])
  end
end
