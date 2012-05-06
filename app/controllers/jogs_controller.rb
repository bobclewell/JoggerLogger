class JogsController < ApplicationController
  before_filter :authenticate_user!

  # GET /jogs
  # GET /jogs.json
  def index
    @jogs = Jog.where('user_id = ?', current_user.id).order("jogged_at DESC").exists

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jogs }
    end
  end

  # GET /jogs/1
  # GET /jogs/1.json
  def show
    @jog = Jog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jog }
    end
  end

  # GET /jogs/new
  # GET /jogs/new.json
  def new
    @jog = Jog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jog }
    end
  end

  # GET /jogs/1/edit
  def edit
    @jog = Jog.find(params[:id])
  end

  # POST /jogs
  # POST /jogs.json
  def create
    @jog = Jog.new(params[:jog])
    
    @jog.check_goal_status_for current_user if current_user.current_goal
    #   flash[:notice] = 'Goal Achieved!'
    # end

    respond_to do |format|
      if @jog.save
        format.html { redirect_to jogs_path, notice: 'Jog was successfully created.' }
        format.json { render json: @jog, status: :created, location: @jog }
      else
        format.html { render action: "new" }
        format.json { render json: @jog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jogs/1
  # PUT /jogs/1.json
  def update
    @jog = Jog.find(params[:id])

    respond_to do |format|
      if @jog.update_attributes(params[:jog])
        format.html { redirect_to @jog, notice: 'Jog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jogs/1
  # DELETE /jogs/1.json
  def destroy
    @jog = Jog.find(params[:id])
    @jog.logically_delete

    respond_to do |format|
      format.html { redirect_to jogs_url }
      format.json { head :no_content }
    end
  end
end
