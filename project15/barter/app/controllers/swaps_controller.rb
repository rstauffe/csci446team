class SwapsController < ApplicationController
  before_action :set_swap, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, except: [:new, :create]

  # GET /swaps
  # GET /swaps.json
  def index
    @swaps = Swap.all
    @items = Item.all
  end
  
  # GET /pending
  def pending
    @swaps = Swap.all
    @items = Item.all
  end
  
  def complete_swap
    @swap = Swap.find(params[:id])
    @swap.completed = true
    @swap.save
    @item = Item.find(@swap.item1)
    @item.is_used = true
    @item.save
    redirect_to catalog_url
  end

  # GET /swaps/1
  # GET /swaps/1.json
  def show
  end

  # GET /swaps/new
  def new
    @swap = Swap.new
    @item1 = params[:item1]
  end

  # GET /swaps/1/edit
  def edit
  end

  # POST /swaps
  # POST /swaps.json
  def create
    @swap = Swap.new(swap_params)

    respond_to do |format|
      if @swap.save
        format.html { redirect_to @swap, notice: 'Swap was successfully created.' }
        format.json { render action: 'show', status: :created, location: @swap }
      else
        format.html { render action: 'new' }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swaps/1
  # PATCH/PUT /swaps/1.json
  def update
    respond_to do |format|
      if @swap.update(swap_params)
        format.html { redirect_to @swap, notice: 'Swap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @swap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swaps/1
  # DELETE /swaps/1.json
  def destroy
    @swap.destroy
    respond_to do |format|
      format.html { redirect_to swaps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swap
      @swap = Swap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swap_params
      params.require(:swap).permit(:item1, :name, :description, :image, :completed)
    end
end
