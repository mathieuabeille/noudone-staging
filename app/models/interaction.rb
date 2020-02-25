class Interaction < ApplicationRecord
  belongs_to :user
  belongs_to :flow
  belongs_to :task
  belongs_to :batch
end
