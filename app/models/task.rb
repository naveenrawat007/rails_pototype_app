class Task < ApplicationRecord
  has_one :photo, as: :image
end
