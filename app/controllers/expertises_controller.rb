class ExpertisesController < ApplicationController
  # GET /expertises
  # GET /expertises.json
  def index
    @expertises = Expertise.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expertises }
    end
  end

  # GET /expertises/1
  # GET /expertises/1.json
  def show
    @expertise = Expertise.find(params[:id])
    @user = @expertise.user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expertise }
    end
  end

  # GET /expertises/new
  # GET /expertises/new.json
  def new
    @expertise = Expertise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expertise }
    end
  end

  # GET /expertises/1/edit
  def edit
    @expertise = Expertise.find(params[:id])
  end

  # POST /expertises
  # POST /expertises.json
  def create
    @expertise = Expertise.new(params[:expertise])
    @expertise.user = current_user
    @expertise.positive = 0
    @expertise.negative = 0

    respond_to do |format|
      if @expertise.save
        format.html { redirect_to current_user, notice: 'Expertise was successfully created.' }
        format.json { render json: @expertise, status: :created, location: @expertise }
      else
        format.html { render action: "new" }
        format.json { render json: @expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  def calificar
    @expertise = Expertise.find(params[:expertise_id])
    @votacion = Votacion.new
    @votacion.user_id = current_user.id
    @votacion.expertise_id = @expertise.id

    nota = params[:nota]

    if nota == "positivo"
      @expertise.positive += 1
    else 
      @expertise.negative += 1
    end



    if @votacion.save && @expertise.save
      redirect_to @expertise
    end
  end

  # PUT /expertises/1
  # PUT /expertises/1.json
  def update
    @expertise = Expertise.find(params[:id])

    respond_to do |format|
      if @expertise.update_attributes(params[:expertise])
        format.html { redirect_to @expertise, notice: 'Expertise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expertises/1
  # DELETE /expertises/1.json
  def destroy
    @expertise = Expertise.find(params[:id])
    @expertise.destroy

    respond_to do |format|
      format.html { redirect_to expertises_url }
      format.json { head :no_content }
    end
  end
end
