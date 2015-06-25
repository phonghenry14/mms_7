class Admin::PositionsController < ApplicationController
  before_action :admin_user
  before_action :set_position, only: [:edit, :update, :destroy]

  def index
    @search = Position.search params[:q]
    @positions = @search.result
    @positions.paginate page: params[:page],
                        per_page: Settings.page.max_page
    respond_to do |format|
      format.html
      format.csv {send_data @positions.to_csv}
    end
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
  end

  def update
    if @position.update_attributes position_params
      flash[:success] = t "position.update.success"
      redirect_to admin_positions_path
    else
      flash[:danger] = t "position.update.danger"
      render :edit
    end
  end

  def destroy
    @position.destroy
    flash[:success] = t "position.destroy.success"
    redirect_to admin_positions_path
  end

  private
  def position_params
    params.require(:position).permit :id, :name, :abbreviation
  end

  def set_position
    @position = Position.find params[:id]
  end
end
