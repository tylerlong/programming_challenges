class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def new
    @challenge = Challenge.new
  end


  def create
    @challenge = Challenge.new(params[:challenge])
    if @challenge.save
      redirect_to @challenge, notice: "Successfully created challenge."
    else
      render "new"
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
