class Admin::RedemptionsController < AdminController
  before_action :set_catalog, only: [:show, :edit, :update, :destroy]

  # GET /redemptions
  # GET /redemptions.json
  def index
    @redemptions = Cart.all
  end

  # GET /redemptions/1
  # GET /redemptions/1.json
  def show
  end

  # GET /redemptions/new
  def new
    @redemption = Cart.new
  end

  # GET /redemptions/1/process
  def edit
    @cart_details = @redemption.cart_details
  end

  # POST /redemptions
  # POST /redemptions.json
  def create
    @redemption = Cart.new(redemption_params)

    respond_to do |format|
      if @redemption.save
        format.html { redirect_to admin_redemptions_url, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @redemption }
      else
        format.html { render :new }
        format.json { render json: @redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redemptions/1
  # PATCH/PUT /redemptions/1.json
  def update
    respond_to do |format|
      if @redemption.update(redemption_params)
        format.html { redirect_to admin_redemptions_url, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @redemption }
      else
        @cart_details = @redemption.cart_details
        format.html { redirect_to edit_admin_redemption_path(@redemption),
                flash: { error: @redemption.errors.full_messages.to_sentence } }
        format.json { render json: @redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redemptions/1
  # DELETE /redemptions/1.json
  def destroy
    @redemption.destroy
    respond_to do |format|
      format.html { redirect_to admin_redemptions_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @redemption = Cart.includes(:cart_details).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redemption_params
      params.require(:cart).permit(:user_id, cart_details_attributes: [:id, :approved])
    end
end
