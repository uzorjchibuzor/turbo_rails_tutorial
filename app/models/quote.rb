class Quote < ApplicationRecord
  validates :name, presence: true
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy

  scope :ordered, -> { order(id: :desc) }
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  broadcasts_to ->(quote) { [quote.company,"quotes"] }, inserts_by: :prepend

end
