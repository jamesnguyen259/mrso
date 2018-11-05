class Kind < ApplicationRecord
  belongs_to :film
  belongs_to :category
end
