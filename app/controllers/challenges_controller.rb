class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.default_order
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
    if @challenge
      @previous = Challenge.find_by_position(@challenge.position - 1)
      @next = Challenge.find_by_position(@challenge.position + 1)
    end
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


  def test
    challenge = Challenge.find(params[:id])
    challenge.solution = params[:solution]
    session[:solution] =params[:solution]
    if challenge.valid?
      redirect_to :back, notice: "You've provided a correct solution!"
    else
      session[:error_messages] = challenge.errors.full_messages
      flash[:error] = "There are some issues of your solution"
      redirect_to :back
    end
  end
end
