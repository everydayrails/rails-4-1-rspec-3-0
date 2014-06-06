class Phone < ActiveRecord::Base
  belongs_to :contact

  validates :phone, uniqueness: { scope: :contact_id }
end
