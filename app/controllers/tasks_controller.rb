class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Task.create(name: params[:name], task_date: params[:date], task_type: params[:type])
    redirect_to root_path
  end


end
