class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :leads, foreign_key: :created_by, class_name: 'Lead', dependent: :nullify
  has_many :sales_proposals, foreign_key: :created_by_id, class_name: "SalesProposal", dependent: :nullify
end
