class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy, :change_route]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)
    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Тур создан.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    if ((params[:tour][:route_attributes][:city_id]) != (params[:tour][:route_attributes][:city_attributes][:id]))
      if(params[:tour][:route_attributes][:city_id].to_i > 0)
        params[:tour][:route_attributes][:city_attributes].clear
        @tour.route.city = City.find_by_id(params[:tour][:route_attributes][:city_id])
      end
    end
    if ((params[:tour][:route_id]) != (params[:tour][:route_attributes][:id]))
      if(params[:tour][:route_id].to_i > 0)
        params[:tour][:route_attributes].clear
        @tour.route = Route.find_by_id(params[:tour][:route_id])
      end
    end
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Тур изменен.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Тур удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:route_id, :tdate, :days, :payment, :tdesc,
        route_attributes: [:id, :_destroy, :rname, :city_id, :rdesc, :rprice,
        city_attributes: [:id, :_destroy, :cname]])
    end

    def check_ctr_auth()
      if @current_role_user.try(:is_admin?)
        return true
      else
        return true if (action_name.to_sym == :index or action_name.to_sym == :show)
      end
    end
end
