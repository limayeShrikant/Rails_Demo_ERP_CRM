class LeadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  def index
    # respond_to do |format|
    #   format.html
    #   format.json { render json: LeadsDatatable.new(view_context, current_user.id) }
    # end
    #  puts "#{current_user.id} is the ID"
    @leads = Lead.where(created_by: current_user.id)
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.create(leads_params)
    @lead.created_by = current_user.id

    if @lead.save
      redirect_to @lead
    else
      render :new
    end
  end

  def edit
    @lead = Lead.find(params[:id])
  end

  def update
    @lead = Lead.create(leads_params)

    if @lead.update
      redirect_to @lead
    else
      render :edit
    end
  end

  def show
    @addresses = Address.where(addressable_id: @lead.id)
  end

  def destroy
    @lead.destroy
    redirect_to leads_path
  end

  private

  def set_lead
    @lead = Lead.find(params[:id])
  end

  def leads_params
    params.require(:lead).permit(:first_name, :last_name, :email, :company, :phone, :city, :created_by, addresses_attributes: [:id, :address_type, :address_detail, :city, :state, :country, :pincode, :created_by, :_destroy])
  end

  def set_collections
    @designations = ['Architect', 'Architect Firm', 'Project Architect', 'Consultant', 'Owner', 'PMC', 'Supervisor', 'Project InCharge'].sort
    @source = ["Website","Events & Exhibition", "Architect", "Referral", "Dealer", "Advertisement", "InternalSurvey", "Instagram", "Other Marketing", "Others"]
  end
end
