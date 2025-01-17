class SalesProposalsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :set_collections

  def index
    @sales_proposals = SalesProposal.all
  end

  def show
  end

  def new
    @sales_proposal = SalesProposal.new
  end

  def create
    @sales_proposal = current_user.sales_proposals.build(sales_proposals_params)

    if @sales_proposal.save
      redirect_to sales_proposals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_sales_proposal
    @sales_proposal = SalesProposal.find(params[:id])
  end

  def sales_proposals_params
    params.require(:sales_proposal).permit(:lead_id, :lead_name, :product, :state, :status, :architect_name, :architect_contact, :source, :won, :lost,
                                            :quotation_date, :quotation_reference, :won_qty, :won_date, :won_unit, :lost_against_information, :alternate_product_rate,
                                            :last_opened_on, :locked, :locked_on, :project_execution_id, :created_by_id )
  end

  def set_collections
    @leads = Lead.where(created_by: current_user.id).order("first_name ASC").map{|ld| [ld.first_name, ld.id]}
    @products = %w[MaatraWindow PermaDoor PermaWindow PermaClad PermaDeck MaatraClad MaatraDeck Custom]
    @status = ['Awaiting Drawings', 'To be quoted - Drgs Recd']
    @state = ['Very Hot', 'Hot', 'Warm', 'Cold', 'Dormant']
  end
end
