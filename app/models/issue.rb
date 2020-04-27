class Issue < ApplicationRecord
  belongs_to :customer
  default_scope -> { order(created_at: :desc) }
  validates :customer_id, presence:true
  validates :issue_type, presence:true
  validates :title, presence:true, length: {maximum: 100}
  validates :description, presence:true
end
