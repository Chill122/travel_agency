class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, :only => [:index, :show]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all.order(start_date: :ASC)
    @reservations = Reservation.joins(:offer).where(:user_id => current_user).merge(Offer.order(start_date: :asc))
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @reservations = Reservation.where(:offer_id => @offer)
    @comments = Comment.where(:offer_id => @offer)
    @comment = Comment.new(offer_id: params[:offer_id])
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    @accommodations = Accommodation.all.order(title: :ASC)
    @accommodation = Accommodation.new
  end

  # GET /offers/1/edit
  def edit
    @accommodations = Accommodation.all.order(title: :ASC)
    @accommodation = Accommodation.new
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    
    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:title, :price, :spots, :start_date, :end_date, :description, :image, :accommodation_id)
    end
end