class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
  end
end
