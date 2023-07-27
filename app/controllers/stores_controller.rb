class StoresController < ApplicationController
  before_action :authenticate_user!

  # GET /stores or /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1 or /stores/1.json
  def show
    details = Store.details(params[:id])
    @details = JSON.parse(details.body)["results"]["shop"]
  end
  #GET /stores/search
  def search
    @lat = params[:lat]
    @lng = params[:lng]
    @range = params[:range]

    stores = Store.get_stores(@lat, @lng, @range)
    @stores = JSON.parse(stores.body)["results"]["shop"]
    @stores = Kaminari.paginate_array(@stores).page(params[:page]).per(5)
  end
  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores or /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to store_url(@store), notice: "Store was successfully created." }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1 or /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to store_url(@store), notice: "Store was successfully updated." }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1 or /stores/1.json
  def destroy
    @store.destroy

    respond_to do |format|
      format.html { redirect_to stores_url, notice: "Store was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(:id, :name, :address, :open, :close, :logo_pic, :station, :ktai_coupon, :photo_url)
    end
end
