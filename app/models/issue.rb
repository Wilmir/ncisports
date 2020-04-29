class Issue < ApplicationRecord
  belongs_to :customer
  default_scope -> { order(created_at: :asc) }
  validates :customer_id, presence:true
  validates :issue_type, presence:true
  validates :title, presence:true, length: {maximum: 500}
  validates :description, presence:true, length: {maximum: 10000}
end
