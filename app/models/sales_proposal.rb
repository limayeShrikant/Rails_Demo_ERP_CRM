class SalesProposal < ApplicationRecord
  belongs_to :user, foreign_key: :created_by_id, class_name: "User"

  #callbacks
  before_save :set_lead_name




  def set_lead_name
    self.lead_name = Lead.find(lead_id).first_name
  end
end
