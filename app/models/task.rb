class Task < ApplicationRecord
  belongs_to :flow
  belongs_to :user
end
