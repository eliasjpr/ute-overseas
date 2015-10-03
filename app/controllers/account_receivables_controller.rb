class AccountReceivablesController < ApplicationController
  before_action :set_account_receivable, only: [:show, :edit, :update, :destroy]

  # GET /account_receivables
  # GET /account_receivables.json
  def index
    @account_receivables = AccountReceivable.all.page params[:page]
  end

  # GET /account_receivables/1
  # GET /account_receivables/1.json
  def show
  end

  # GET /account_receivables/merge
  def merge
    AccountReceivable.delete_all
  end


  # Post /account_receivables/import/
  def import
    Parser.import(params[:parser][:ats_file], :ats)  if !params[:parser][:ats_file].blank?
    Parser.import(params[:parser][:soft_cargo_file], :soft_cargo) if !params[:parser][:soft_cargo_file].blank?

    @header              = Parser.import(params[:parser][:logisis_file], :logisis) if !params[:parser][:logisis_file].blank?
    @account_receivables = AccountReceivable.all
    @totals              = AccountReceivable.totals
    @aging_report        = AccountReceivable.aging_report

    request.format = "xls"
    respond_to do |format|
     format.xls { render :xls => 'account_receivables_merged.xls' }
    end
    AccountReceivable.delete_all
  end


  # GET /account_receivables/new
  def new
    @account_receivable = AccountReceivable.new
  end



  # POST /account_receivables
  # POST /account_receivables.json
  def create
    @account_receivable = AccountReceivable.new(account_receivable_params)

    respond_to do |format|
      if @account_receivable.save
        format.html { redirect_to @account_receivable, notice: 'Account receivable was successfully created.' }
        format.json { render :show, status: :created, location: @account_receivable }
      else
        format.html { render :new }
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_receivables/1
  # PATCH/PUT /account_receivables/1.json
  def update
    respond_to do |format|
      if @account_receivable.update(account_receivable_params)
        format.html { redirect_to @account_receivable, notice: 'Account receivable was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_receivable }
      else
        format.html { render :edit }
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_receivables/1
  # DELETE /account_receivables/1.json
  def destroy
    @account_receivable.destroy
    respond_to do |format|
      format.html { redirect_to account_receivables_url, notice: 'Account receivable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_account_receivable
      @account_receivable = AccountReceivable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_receivable_params
      params.require(:account_receivable).permit(:location, :invoice_date, :invoice_number, :bill_amount, :amount_received, :due_date, :customer_po)
    end

end
