class Lead < ApplicationRecord
  belongs_to :user, foreign_key: :created_by, class_name: 'User'
  has_many :addresses, as: :addressable, inverse_of: :addressable, dependent: :destroy

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true



end
