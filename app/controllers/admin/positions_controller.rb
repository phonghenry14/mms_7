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
      flash[:success] = t("position.create.success")
      redirect_to admin_positions_path
    else
      flash[:danger] = t("position.create.danger")
      render :new
    end
  end

  private
  def position_params
    params.require(:position).permit :id, :name, :abbreviation
  end
end
