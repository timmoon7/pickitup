class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :accept, :decline, :assign, :complete, :charge]
  # before_action :authenticate_user!, only: [:charge]
  before_action :authenticate_user!, except: [:index, :show]
  after_action :verify_authorized
  helper_method :sort_column, :sort_direction
  
  # GET /tasks
  # GET /tasks.json
  def index
    if !params[:tasks].present? && params[:search_category].blank?
      @tasks = Task.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], per_page: 5)
    else
      unless category_selected.blank?
        @search_category = category_selected
        @tasks = Task.where(main_category_id: @search_category).order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], per_page: 5)
      else
        @tasks = Task.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], per_page: 5)
      end
      # @tasks = Task.search_by_name(search_task)      
    end
    authorize @tasks
  end

  # GET /myposts
  # GET /myposts.json
  def list_mypost
    @tasks = Task.where(user: current_user).order(updated_at: :desc).paginate(:page => params[:page], per_page: 5)
    authorize @tasks
  end

  # GET /mytasks
  # GET /mytasks.json
  def list_mytask
    # only tasks driver is current_user and user is not current_user (default driver: current_user)
    @tasks = Task.where(driver: current_user).where.not(user: current_user).order(updated_at: :desc).paginate(:page => params[:page], per_page: 5)
    authorize @tasks
  end


  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    authorize @task
  end

  # GET /tasks/1/edit
  def edit
  end

# POST /tasks/1/charge
def charge
    if current_user.stripe_id.blank?
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
      current_user.stripe_id = customer.id
      current_user.save!
    end

      charge = Stripe::Charge.create(
        customer: current_user.stripe_id,
        amount: @task.price.to_i,
        description: @task.title,
        currency: 'AUD'
      )

      # current_user.charges << Charge.new(charge_id: charge.id)
      
      # update the task status to 'paid' after the payment
      @task.update_attributes(status: 'paid')

      flash[:notice] = 'Payment made!'
      redirect_back fallback_location: tasks_path      


      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_back fallback_location: tasks_path

      rescue ActiveRecord::RecordNotSaved => e
        flash[:error] = e.message
        redirect_back fallback_location: tasks_path

  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    authorize @task

    @task.user = current_user
    @task.status = 'posted'
    @task.driver = current_user

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
  def decline
    respond_to do |format|
      if @task.update_attributes(status: 'declined')
        format.html { redirect_to tasks_url, notice: 'User declined the task successfully.' }
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
    authorize @task
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end

    def category_selected
      params[:search_category] ? params[:search_category] : params[:tasks][:main_category_id]
    end

    def set_task
      @task = Task.find(params[:id])
      authorize @task
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:main_category_id, :title, :body, :image, :delivery_address, :pickup_address, :price, :pickup_time)
    end
end
