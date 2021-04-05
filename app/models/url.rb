class Url < ApplicationRecord
  belongs_to :user
  validates :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true
  validates :long_url, length: { minimum: 9 }

  before_create :generate_short_url, :sanitize

  # generate short_url with a unique key with base 36
  # if no short_url is provided
  def generate_short_url
    short_url.nil? || short_url.empty? ? rand(36**8).to_s(36) : short_url
  end

  # Before saving the long_url make sure to add http:// https://
  def sanitize
    long_url.strip!
    sanitize_url = long_url.downcase.gsub(/(https?:\/\/)|(www\.)/, '')
    "http://#{sanitize_url}"
  end
end
