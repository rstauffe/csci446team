class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_selection

  # GET /selections
  # GET /selections.json
  def index
    @selections = Selection.all
  end

  # GET /selections/1
  # GET /selections/1.json
  def show
  end

  # GET /selections/new
  def new
    @selection = Selection.new
  end

  # GET /selections/1/edit
  def edit
  end

  # POST /selections
  # POST /selections.json
  def create
    @selection = Selection.new(selection_params)

    respond_to do |format|
      if @selection.save
        format.html { redirect_to @selection, notice: 'Selection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @selection }
      else
        format.html { render action: 'new' }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selections/1
  # PATCH/PUT /selections/1.json
  def update
    respond_to do |format|
      if @selection.update(selection_params)
        format.html { redirect_to @selection, notice: 'Selection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  def destroy
    @selection.destroy if @selection.id == session[:selection_id]
    session[:selection_id] = nil
    respond_to do |format|
      format.html { redirect_to adoption_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection
      @selection = Selection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_params
      params[:selection]
    end
    
    def invalid_selection
      logger.error "Attempt to access invalid selection #{params[:id]}"
      redirect_to adoption_url, notice: 'Invalid selection'
    end
end
