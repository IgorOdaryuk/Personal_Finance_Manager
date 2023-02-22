class Operation < ApplicationRecord
  paginates_per 10

  scope :filter_by_start_date, -> (start_date) { where "odate >= ?", start_date }
  scope :filter_by_final_date, -> (final_date) { where "odate <= ?", final_date }
  scope :filter_by_category_id, -> (category_id) { where "category_id = ?", category_id }

  belongs_to :category
  belongs_to :user

  validates :amount, numericality: { greater_than: 0 }
  validates :odate, :description, presence: true
end
