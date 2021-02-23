class CarriagesController < ApplicationController
  before_action :set_carriage, only: %i[show edit update destroy]

  def index
    @carriage = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def edit; end

  def create
    @carriage = Carriage.new(carriage_params)

    respond_to do |format|
      if @carriage.save
        format.html { redirect_to @carriage, notice: 'Carriage was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @carriage.update(carriage_params)
        format.html { redirect_to @carriage, notice: 'Carriage was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @carriage.destroy
    respond_to do |format|
      format.html { redirect_to carriages_url, notice: 'Carriage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:compartment, :up_seats, :down_seats, :train_id)
  end
end
