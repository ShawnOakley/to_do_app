class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def new
    @team=Team.find(params[:team_id])
  end

  def create
    begin
    ActiveRecord::Base.transaction do
      params[:project][:team_id] = params[:team_id]
      @project = Project.new(params[:project])
    end

    @project.save

    if !params[:item].nil?
      params[:item][:project_id] = @project.id

      @item = Item.new(params[:item])
      @item.save
      raise "invalid" unless @project.valid? && @item.valid?
    else
     raise "invalid" unless @project.valid?
    end
  end
    rescue
      fail
    else
      redirect_to project_url(@project)
    end
end

