class LaddersController < ApplicationController
  before_action :set_ladder, only: [:show, :edit, :update, :destroy]

  # GET /ladders
  # GET /ladders.json
  def index
    @ladders = Ladder.all
  end

  # GET /ladders/1
  # GET /ladders/1.json
  def show
  end

  # GET /ladders/new
  def new
    @ladder = Ladder.new
  end

  # GET /ladders/1/edit
  def edit
  end

  # POST /ladders
  # POST /ladders.json
  def create
    @ladder = Ladder.new(ladder_params)

    respond_to do |format|
      if @ladder.save
        format.html { redirect_to @ladder, notice: 'Ladder was successfully created.' }
        format.json { render :show, status: :created, location: @ladder }
      else
        format.html { render :new }
        format.json { render json: @ladder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ladders/1
  # PATCH/PUT /ladders/1.json
  def update
    respond_to do |format|
      if @ladder.update(ladder_params)
        format.html { redirect_to @ladder, notice: 'Ladder was successfully updated.' }
        format.json { render :show, status: :ok, location: @ladder }
      else
        format.html { render :edit }
        format.json { render json: @ladder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ladders/1
  # DELETE /ladders/1.json
  def destroy
    @ladder.destroy
    respond_to do |format|
      format.html { redirect_to ladders_url, notice: 'Ladder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ladder
      @ladder = Ladder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ladder_params
      params.require(:ladder).permit(:name, :size, :description)
    end
end
