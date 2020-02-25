class Batch < ApplicationRecord
  belongs_to :user
  belongs_to :flow
end
