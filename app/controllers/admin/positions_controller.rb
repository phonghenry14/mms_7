class Admin::PositionsController < ApplicationController
  def index
    @search = Position.search params[:q]
    @positions = @search.result
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new position_params
    if @position.save
      flash[:success] = t "position.create.success"
      redirect_to admin_positions_path
    else
      flash[:danger] = t "position.create.danger"
      render :new
    end
  end

  def edit
    @position = Position.find params[:id]
  end

  def update
    @position = Position.find params[:id]
    if @position.update_attributes position_params
      flash[:success] = t "position.update.success"
      redirect_to admin_positions_path
    else
      flash[:danger] = t "position.update.danger"
      render :edit
    end
  end

  def destroy
    Position.find(params[:id]).destroy
    flash[:success] = t "position.destroy.success"
    redirect_to admin_positions_path
  end


  private
  def position_params
    params.require(:position).permit :id, :name, :abbreviation
  end
end
