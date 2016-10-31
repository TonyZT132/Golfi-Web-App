class SponsorshipsController < ApplicationController
  before_action :authenticate_account!, except: [:show]

  # GET /sponsorships
  # GET /sponsorships.json
  def index
    @sponsorships = Sponsorship.all
  end

  # GET /sponsorships/1
  # GET /sponsorships/1.json
  def show
  end

  # GET /sponsorships/new
  def new
    @sponsorship = Sponsorship.new
  end

  # GET /sponsorships/1/edit
  def edit
  end

  # POST /sponsorships
  # POST /sponsorships.json
  def create
    @sponsorship = Sponsorship.new(sponsorship_params)
    if @sponsorship.save
          redirect_to tournaments_show_path(:tournament_id => @sponsorship.tournament_id), notice: 'sponsorship donated'
    else
        render 'new', notice: 'Invalid'
    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsorship
      @sponsorship = Sponsorship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsorship_params
      params.require(:sponsorship).permit(:tournament_id, :sponsor_id, :amount)
    end
end
