class WholesalersController < ApplicationController
  # GET /wholesalers
  # GET /wholesalers.json
  def index
    @wholesalers = Wholesaler.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wholesalers }
    end
  end

  # GET /wholesalers/1
  # GET /wholesalers/1.json
  def show
    @wholesaler = Wholesaler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wholesaler }
    end
  end

  # GET /wholesalers/new
  # GET /wholesalers/new.json
  def new
    @wholesaler = Wholesaler.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wholesaler }
    end
  end

  # GET /wholesalers/1/edit
  def edit
    @wholesaler = Wholesaler.find(params[:id])
  end

  # POST /wholesalers
  # POST /wholesalers.json
  def create
    @wholesaler = Wholesaler.new(params[:wholesaler])

    respond_to do |format|
      if @wholesaler.save
        format.html { redirect_to @wholesaler, notice: 'Wholesaler was successfully created.' }
        format.json { render json: @wholesaler, status: :created, location: @wholesaler }
      else
        format.html { render action: "new" }
        format.json { render json: @wholesaler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wholesalers/1
  # PUT /wholesalers/1.json
  def update
    @wholesaler = Wholesaler.find(params[:id])

    respond_to do |format|
      if @wholesaler.update_attributes(params[:wholesaler])
        format.html { redirect_to @wholesaler, notice: 'Wholesaler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wholesaler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wholesalers/1
  # DELETE /wholesalers/1.json
  def destroy
    @wholesaler = Wholesaler.find(params[:id])
    @wholesaler.destroy

    respond_to do |format|
      format.html { redirect_to wholesalers_url }
      format.json { head :no_content }
    end
  end
end
