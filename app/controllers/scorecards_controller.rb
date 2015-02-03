class ScorecardsController < ApplicationController
  before_action :set_scorecard, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @scorecards = Scorecard.all
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
      render :new
    end
  end

  def update
    if @scorecard.update(scorecard_params)
      redirect_to @scorecard, notice: 'Scorecard was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @scorecard.destroy
    redirect_to scorecards_url, notice: 'Scorecard deleted.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scorecard
      @scorecard = Scorecard.find(params[:id])
    end

    def correct_user
      @scorecard = current_user.scorecards.find_by(id: params[:id])
      redirect_to scorecards_path, notice: "Not allowed to edit someone else's Scorecard!" if @scorecard.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scorecard_params
      params.require(:scorecard).permit(:description)
    end