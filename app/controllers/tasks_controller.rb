class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :accept, :assign]

  # GET /tasks
  # GET /tasks.json
  def index
    # @tasks = Task.all

    unless params[:tasks].present? 
      @tasks = Task.all
    else
      unless params[:tasks][:main_category_id].blank?
        search_category = params[:tasks][:main_category_id]
        @tasks = Task.where(main_category_id: search_category).all
      else
        @tasks = Task.all
      end
      # @tasks = Task.search_by_name(search_task)      
    end

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.status = 'posted'
    @task.driver_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def accept
    driver = current_user.id
    respond_to do |format|
      if @task.update_attributes(status: 'accepted', driver_id: driver)
        format.html { redirect_to tasks_url, notice: 'Driver accepted the task successfully.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def assign
    respond_to do |format|
      if @task.update_attributes(status: 'assigned')
        format.html { redirect_to tasks_url, notice: 'User assigned the task successfully.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def paid
    respond_to do |format|
      if @task.update_attributes(status: 'paid')
        format.html { redirect_to tasks_url, notice: 'User assigned the task successfully.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def complete
    respond_to do |format|
      if @task.update_attributes(status: 'completed')
        format.html { redirect_to tasks_url, notice: 'User assigned the task successfully.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:main_category_id, :title, :body, :image, :delivery_address, :pickup_address, :price, :pickup_time)
    end
end
