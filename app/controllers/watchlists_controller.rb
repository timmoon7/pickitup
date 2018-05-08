class WatchlistsController < ApplicationController
  
  # GET /watchlists
  # GET /watchlists.json
  def index
    @watchlists = Watchlist.where(user: current_user).all
  end

  # POST /watchlists/1
  # POST /tasks/1.json
  def add
    @watchlist = Watchlist.new()
    @watchlist.user = current_user
    @watchlist.task_id = params[:id]

    respond_to do |format|
      if @watchlist.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully added into your watchlist.' }
        format.json {  head :no_content }
      end
    end
  end

  # DELETE /watchlists/1
  # DELETE /watchlists/1.json
  def delete
    taskid = params[:id]
    pre_page = params[:from]
    watchlist = Watchlist.where(user: current_user).where(task_id: taskid).first

    Watchlist.destroy(watchlist.id)
    respond_to do |format|
      if pre_page == '1' 
        format.html { redirect_to tasks_path, notice: 'Task was successfully destroyed.' }
      else
        format.html { redirect_to watchlists_path, notice: 'Task was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end




end
