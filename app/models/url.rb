class Url < ApplicationRecord
  belongs_to :user
  validates :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true
  validates :long_url, length: { minimum: 9 }
end
