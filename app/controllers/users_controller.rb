class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    begin
    ActiveRecord::Base.transaction do
      @user = User.new(params[:user])
    end
    @user.save

    if !params[:team].nil?
      @team_choices = params[:team].keys.map(&:to_i)
      @team_choices = @team_choices.map do |team_id|
        TeamMembership.new(team_id: team_id, user_id: @user.id)
      end
      @team_choices = @team_choices.each do |team|
        team.save
      end
      raise "invalid" unless @user.valid? && @team_choices.all? { |obj| obj.valid? }
    else
      raise "invalid" unless @user.valid?
    end
  end
  rescue
    fail
  else
    redirect_to new_user_url
  end

end

