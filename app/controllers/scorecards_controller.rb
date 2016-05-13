class ScorecardsController < ApplicationController
  before_action :set_scorecard, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @scorecards = Scorecard.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @scorecard = current_user.scorecards.build
  end

  def edit
  end

  def create
    @scorecard = current_user.scorecards.build(scorecard_params)
    if @scorecard.save
      redirect_to @scorecard, notice: 'Scorecard was successfully created.'
    else
      flash.now[:alert] = "Your scorecard could not be updated."
      render :new
    end
  end

  def update
    if @scorecard.update_attributes(scorecard_params)
      redirect_to @scorecard, notice: 'Scorecard was successfully updated.'
    else
      flash.now[:alert] = "Your scorecard could not be updated."
      render :edit
    end
  end

  def destroy
    @scorecard.destroy
    redirect_to scorecards_url, notice: 'Scorecard deleted.'
  end

  private

    def set_scorecard
      @scorecard = Scorecard.find(params[:id])
    end

    def correct_user
      @scorecard = current_user.scorecards.find_by(id: params[:id])
      redirect_to scorecards_path, notice: "Not allowed to change someone else's Scorecard!" if @scorecard.nil?
    end

    def scorecard_params
      params.require(:scorecard).permit(
                                        :description,
                                        :gametype, 
                                        :playername, 
                                        :rounds, 
                                        :number_of_players, 
                                        :location)
    end
  end
