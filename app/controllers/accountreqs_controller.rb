class AccountreqsController < ApplicationController
  before_action :set_accountreq, only: [:show, :edit, :update, :destroy]

  # GET /accountreqs
  # GET /accountreqs.json
  def index
    @accountreqs = Account.where("status = ?", "pending")

  end

  # GET /accountreqs/1
  # GET /accountreqs/1.json
  def show
  end

  # GET /accountreqs/new
  def new
    @accountreq = Accountreq.new
  end

  # GET /accountreqs/1/edit
  def edit
    @accountreq = Account.find(params[:id])
    @accountreq.status = 'accepted'
    @accountreq.save
  end

  # POST /accountreqs
  # POST /accountreqs.json
  def create
    @accountreq = Account.new(accountreq_params)

    respond_to do |format|
      if @accountreq.save
        format.html { redirect_to @accountreq, notice: 'Accountreq was successfully created.' }
        format.json { render :show, status: :created, location: @accountreq }
      else
        format.html { render :new }
        format.json { render json: @accountreq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountreqs/1
  # PATCH/PUT /accountreqs/1.json
  def update
    respond_to do |format|

        format.html { redirect_to @accountreq, notice: 'Accountreq was successfully updated.' }
        format.json { render :show, status: :ok, location: @accountreq }
    end
  end

  # DELETE /accountreqs/1
  # DELETE /accountreqs/1.json
  def destroy
    @accountreqs = Account.find(params[:id])
    @accountreqs.status = 'rejected'
    @accountreqs.save
    respond_to do |format|
      format.html { redirect_to accountreqs, notice: 'Accountreq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accountreq
      @accountreq = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accountreq_params
      params.fetch(:accountreq, {})
    end
end
