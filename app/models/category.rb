class Category < ApplicationRecord
    paginates_per 9

    belongs_to :user
    has_many :operations, dependent: :destroy

    validates :name, :description, presence: true
end
