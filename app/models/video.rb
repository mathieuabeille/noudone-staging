class Video < ApplicationRecord
  belongs_to :user
  belongs_to :flow
  belongs_to :task
end
