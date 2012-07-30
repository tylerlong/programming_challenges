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

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update_attributes(params[:challenge])
      redirect_to @challenge, notice: "Successfully updated challenge."
    else
      render "edit"
    end
  end
end
