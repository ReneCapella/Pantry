class PantriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pantry, only: %i[ edit update destroy ]

  # GET /pantries or /pantries.json
  def index
    user = User.find(current_user.id)
    @pantry = user.try(:pantry)
    if @pantry
      redirect_to pantry_path(@pantry.id)
    else
      redirect_to new_pantry_path
    end
  end

  # GET /pantries/1 or /pantries/1.json
  def show
    user = User.find(current_user.id)
    @pantry = user.pantry
  end

  # GET /pantries/new
  def new
    @pantry = Pantry.new
  end

  # GET /pantries/1/edit
  def edit
  end

  # POST /pantries or /pantries.json
  def create
    @pantry = Pantry.new(pantry_params)

    respond_to do |format|
      if @pantry.save
        current_user.update(pantry_id: @pantry.id)
        format.html { redirect_to pantry_url(@pantry), notice: "Pantry was successfully created." }
        format.json { render :show, status: :created, location: @pantry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pantry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pantries/1 or /pantries/1.json
  def update
    respond_to do |format|
      if @pantry.update(pantry_params)
        format.html { redirect_to pantry_url(@pantry), notice: "Pantry was successfully updated." }
        format.json { render :show, status: :ok, location: @pantry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pantry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pantries/1 or /pantries/1.json
  def destroy
    @pantry.destroy

    respond_to do |format|
      format.html { redirect_to pantries_url, notice: "Pantry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pantry
      puts "PARAMS PANTRY"
      puts params
      @pantry = Pantry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pantry_params
      params.fetch(:pantry, {}).permit(:user_id, :name)
    end
end
