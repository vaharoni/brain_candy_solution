class BrainCandiesController < ApplicationController
  before_filter :find_brain_candy, only: [:show, :edit, :update, :destroy, :claim_complete, :verify]

  # GET /brain_candies
  # GET /brain_candies.json
  def index
    @brain_candies = BrainCandy.includes(:difficulty_level).all

    respond_to do |format|
      format.html # index.html.erb.erb
      format.json { render json: @brain_candies }
    end
  end

  # GET /brain_candies/1
  # GET /brain_candies/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brain_candy }
    end
  end

  # GET /brain_candies/new
  # GET /brain_candies/new.json
  def new
    @brain_candy = BrainCandy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brain_candy }
    end
  end

  # GET /brain_candies/1/edit
  def edit
  end

  # POST /brain_candies
  # POST /brain_candies.json
  def create
    @brain_candy = BrainCandy.new(params[:brain_candy])

    respond_to do |format|
      if @brain_candy.save
        format.html { redirect_to @brain_candy, notice: 'Brain candy was successfully created.' }
        format.json { render json: @brain_candy, status: :created, location: @brain_candy }
      else
        format.html { render action: "new" }
        format.json { render json: @brain_candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brain_candies/1
  # PUT /brain_candies/1.json
  def update
    respond_to do |format|
      if @brain_candy.update_attributes(params[:brain_candy])
        format.html { redirect_to @brain_candy, notice: 'Brain candy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brain_candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brain_candies/1
  # DELETE /brain_candies/1.json
  def destroy
    @brain_candy.destroy

    respond_to do |format|
      format.html { redirect_to brain_candies_url }
      format.json { head :no_content }
    end
  end

  def claim_complete
    current_user.claim_complete(@brain_candy)
    redirect_to :root
  end

  # user_id
  def verify
    user_id = params[:user_id]
    raise "user_id must be provided" unless user_id
    raise "Stop hacking me" if current_user.id == user_id

    current_user.verify @brain_candy, user_id
    redirect_to :root
  end

  private

  def find_brain_candy
    @brain_candy = BrainCandy.find(params[:id])
  end
end
