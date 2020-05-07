class HomeController < ApplicationController

  def index
    @tasks = Task.all
    @tasks_by_date = @tasks.group_by(&:task_date)
  end

  def new
  end

  def edit
    @markers = [ { lat: 29.930858, lng: 78.102183}, { lat: 30.023305, lng: 78.215210}, {lat: 30.083158, lng: 78.263740}]
    respond_to do |format|
      format.html
      format.json {render json: @markers}
    end
  end

end




  