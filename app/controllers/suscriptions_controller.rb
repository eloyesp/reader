class SuscriptionsController < ApplicationController
  # GET /suscriptions
  # GET /suscriptions.json
  def index
    @suscriptions = Suscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @suscriptions }
    end
  end

  # GET /suscriptions/1
  # GET /suscriptions/1.json
  def show
    @suscription = Suscription.find(params[:id])
    @articles    = @suscription.articles

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @suscription }
    end
  end

  # GET /suscriptions/new
  # GET /suscriptions/new.json
  def new
    @suscription = Suscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @suscription }
    end
  end

  # GET /suscriptions/1/edit
  def edit
    @suscription = Suscription.find(params[:id])
  end

  # POST /suscriptions
  # POST /suscriptions.json
  def create
    @suscription = Suscription.new(params[:suscription])

    respond_to do |format|
      if @suscription.save
        format.html { redirect_to @suscription, notice: "You have successfully suscripted to #{@suscription.title}" }
        format.json { render json: @suscription, status: :created, location: @suscription }
      else
        format.html { render action: "new" }
        format.json { render json: @suscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /suscriptions/1
  # PUT /suscriptions/1.json
  def update
    @suscription = Suscription.find(params[:id])

    respond_to do |format|
      if @suscription.update_attributes(params[:suscription])
        format.html { redirect_to @suscription, notice: 'Suscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @suscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suscriptions/1
  # DELETE /suscriptions/1.json
  def destroy
    @suscription = Suscription.find(params[:id])
    @suscription.destroy

    respond_to do |format|
      format.html { redirect_to suscriptions_url }
      format.json { head :no_content }
    end
  end
end

